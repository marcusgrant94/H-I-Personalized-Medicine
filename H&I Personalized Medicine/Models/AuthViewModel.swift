//
//  AuthViewModel.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/14/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isSignedIn: Bool? = nil

        var authStateDidChangeHandler: AuthStateDidChangeListenerHandle?

        init() {
            authStateDidChangeHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.isSignedIn = user != nil
            }
        }

        deinit {
            if let handler = authStateDidChangeHandler {
                Auth.auth().removeStateDidChangeListener(handler)
            }
        }

    func signIn(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
            } else {
                completion(true, nil)
            }
        }
    }

}
