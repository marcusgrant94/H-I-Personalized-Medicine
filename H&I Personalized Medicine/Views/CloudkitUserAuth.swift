//
//  CloudkitUserAuth.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 8/5/22.
//

// ObserableObject- View model any state and be inside and usually a class
// ObservedObject - Instance of a ObservableObject
// Published - This is a property that will update a view refresh when its updated
// @State - Local state to view (UI)
// @Binding
// @StateObject - Similar to @State, used for a entire class
// @EnvironmentObject - Another way to attatch a view model to a view



import SwiftUI
import CloudKit

class CLoudKitUserAuthViewModel: ObservableObject {
    
    static let shared = CLoudKitUserAuthViewModel()
    
    @Published var permissionStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    
    let container = CKContainer(identifier: "iCloud.Hip-Medicine")
    
    init() {
        getiCLoudStatus()
        requestPermission()
         fetchiCLoudUserRecordID()
    }
    
    private func getiCLoudStatus() {
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                switch returnedStatus {
                case .available:
                    self?.isSignedInToiCloud = true
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCLoudAccountNotDetermined.rawValue
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                default:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                }
            }
        }
        
    }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCLoudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission() {
       container.requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStatus,
            returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                self?.permissionStatus = true
                }
            }
        }
    }
    
    func fetchiCLoudUserRecordID() {
        container.fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                self?.discoveriCLoudUser(id: id)
            }
        }
    }
    
    func discoveriCLoudUser(id: CKRecord.ID) {
        container.discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName {
                    self?.userName = name
                }
            }
        }
    }
    
}

struct CloudkitUserAuth: View {
    @ObservedObject var vm = CLoudKitUserAuthViewModel.shared
 //   @StateObject var vm = CLoudKitUserAuthViewModel()
    var body: some View {
        VStack {
            Text("IS SIGNED IN: \(vm.isSignedInToiCloud.description.uppercased())")
            Text(vm.error)
            Text("Permission: \(vm.permissionStatus.description.uppercased())")
            Text("Welcome \(vm.userName)")
    }
    }
}

struct CloudkitUserAuth_Previews: PreviewProvider {
    static var previews: some View {
        CloudkitUserAuth()
    }
}
