//
//  PatientMessageView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/25/23.
//

import SwiftUI

struct PatientMessageView: View {
    @EnvironmentObject var usersViewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ChatView(recipientID: usersViewModel.nurseID ?? "Your Care Team")
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PatientMessageView_Previews: PreviewProvider {
    static var previews: some View {
        PatientMessageView().environmentObject(UsersViewModel())
    }
}
