//
//  NewAccountView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/13/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct NewAccountView: View {
    @State private var email = ""
    @State private var confirmEmail = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var errorMessage: String?

    
    var body: some View {
        VStack {
            Image("LaunchPhoto2")
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
                .keyboardType(.emailAddress)
            
            TextField("Confirm Email", text: $confirmEmail)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            
            Button(action: {
                print("Sign Up button pressed.")
                // Implement sign up functionality here
                if email == confirmEmail && password == confirmPassword {
                    if password.count >= 6 {
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if let error = error {
                                print("Error occurred: \(error.localizedDescription)")
                                errorMessage = error.localizedDescription
                            } else {
                                print("User signed up successfully.")
                                errorMessage = nil
                                
                                // Create Firestore user document
                                if let authUser = authResult?.user {
                                    let userData = [
                                        "id": authUser.uid,
                                        "email": email,
                                        "role": "user",  // Change this if you need different roles
                                        "name": firstName + " " + lastName
                                    ]
                                    
                                    Firestore.firestore().collection("users").document(authUser.uid).setData(userData) { error in
                                        if let error = error {
                                            print("Error occurred: \(error.localizedDescription)")
                                        } else {
                                            print("User document created successfully.")
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        errorMessage = "Password should be at least 6 characters long."
                    }
                } else {
                    errorMessage = "Emails or passwords do not match."
                }
            }) {
                Group {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8.0)
                }
                .padding(.horizontal, 25)
                .padding(.top)
                Spacer()
            }
        }
    }
    }

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
