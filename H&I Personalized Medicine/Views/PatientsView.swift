//
//  PatientsView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/13/23.
//

import SwiftUI
import FirebaseAuth

struct PatientsView: View {
    @State private var isPresentingSheet = false
    @EnvironmentObject var viewModel: UsersViewModel
    @State private var currentUserId: String = ""

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.currentUserRole == "admin" {
                    // If the current user is an admin, show the patient list
                    if viewModel.otherUsers.isEmpty {
                        // If there are no other users, show a placeholder message
                        Image("nodata")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                        
                        Text("No Users!")
                            .bold()
                    } else {
                        List {
                            ForEach(viewModel.otherUsers) { user in
                                NavigationLink(destination: PatientProfile(user: user)) {
                                    Text(user.name)
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                    }
                            }
                        }
                        .onAppear() {
                            if let uid = Auth.auth().currentUser?.uid {
                                currentUserId = uid
                                self.viewModel.fetchData(for: currentUserId)
                            }
                        }
            .navigationTitle("Patients")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .padding()
                    .accessibilityLabel("Settings")
            }.buttonStyle(PlainButtonStyle()))
            .navigationBarItems(trailing:
                                    Button(action: {
                isPresentingSheet = true
            }) {
                Label("", systemImage: "plus")
            }
            )
            .sheet(isPresented: $isPresentingSheet) {
                InviteNewPatientView(isPresenting: $isPresentingSheet)
            }
            .onAppear() {
                if let uid = Auth.auth().currentUser?.uid {
                    currentUserId = uid
                }
                self.viewModel.fetchData(for: currentUserId)
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let user = viewModel.otherUsers[index]
            viewModel.deleteUser(user)
        }
    }

}


struct PatientsView_Previews: PreviewProvider {
    static var previews: some View {
        PatientsView().environmentObject(UsersViewModel())
    }
}
