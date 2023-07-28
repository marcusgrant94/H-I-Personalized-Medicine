//
//  InviteNewPatientView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/13/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct InviteNewPatientView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var confirmEmail = ""
    @Binding var isPresenting: Bool
    @EnvironmentObject var usersViewModel: UsersViewModel

    var body: some View {
        NavigationView {
            VStack {
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
                
                TextField("Confirm Email", text: $confirmEmail)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8.0)
                    .padding(.horizontal, 25)
                
                    .navigationTitle("Enroll New Patient")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                        Button(action: {
                        isPresenting = false
                                        }) {
                                            Text("Cancel")
                                        }
                                    )
                
                Button {
                    if email == confirmEmail {
                        Auth.auth().createUser(withEmail: email, password: "temporaryPassword") { authResult, error in
                            if let error = error {
                                print("Error creating user: \(error)")
                            } else if let user = authResult?.user {
                                // Create a User instance with the necessary information
                                let newUser = User(id: user.uid, email: email, role: "user", name: firstName + " " + lastName, age: nil, height: nil, weight: nil)
                                
                                // Add the new user to Firestore using the UsersViewModel
                                usersViewModel.addUser(newUser)
                                
                                Auth.auth().sendPasswordReset(withEmail: email) { error in
                                    if let error = error {
                                        print("Error sending password reset email: \(error)")
                                    } else {
                                        // The email was sent successfully
                                        print("Password reset email has been sent.")
                                    }
                                }
                            }
                        }
                    } else {
                        // The emails do not match
                        // ...
                    }
                } label: {
                    Text("Invite")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }
                Spacer()
            }
        }
        
        
    }
}

struct InviteNewPatientView_Previews: PreviewProvider {
    static var previews: some View {
        InviteNewPatientView(isPresenting: .constant(false))
    }
}
