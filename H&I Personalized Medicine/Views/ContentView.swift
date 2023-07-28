//
//  ContentView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var usersViewModel: UsersViewModel
    
    var body: some View {
        Group {
            if authViewModel.isSignedIn == nil {
                // Show a loading view or simply an empty view
                // to handle the 'nil' case
                Image("LaunchPhoto2")
            } else if authViewModel.isSignedIn == true {
                TabBar()
            } else {
                LogInView()
            }
        }
        .onAppear {
            if let uid = Auth.auth().currentUser?.uid {
                usersViewModel.fetchData(for: uid)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel()).environmentObject(UsersViewModel())
    }
}
