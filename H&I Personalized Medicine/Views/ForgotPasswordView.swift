//
//  ForgotPasswordView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/15/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var resetEmail = ""
    @State private var isLoading = false
    @State private var isSent = false
    @State private var errorMessage: String?


    var body: some View {
        VStack {
            Spacer()

            Image("forgotpassword")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            
            Text("Forgot \nPassword?")
                .fontWeight(.bold)
                .font(.system(size: 29))
                .padding(.top)
                .offset(x: -90)

            Text("Don't worry it happens! Please enter the email associated with your account")
                .padding(.top)

            TextField("Enter Email", text: $resetEmail)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal, 25)
                .padding(.top)
            
            if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                        }

            Button(action: {
                            isLoading = true
                            Auth.auth().sendPasswordReset(withEmail: self.resetEmail) { error in
                                isLoading = false
                                if let error = error {
                                    // An error happened.
                                    print(error.localizedDescription)
                                    errorMessage = error.localizedDescription
                                } else {
                                    // Password reset email has been sent.
                                    print("Password reset email has been sent.")
                                    isSent = true
                                    errorMessage = nil
                                }
                            }
                        }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.purple)
                    .cornerRadius(8.0)
            }
            .padding(.top)
            .disabled(isLoading)
            
            if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(1.5, anchor: .center)
                        }
            
            if isSent {
                            Text("Password reset email has been sent.")
                                .foregroundColor(.green)
                                .padding(.top)
                        }

            Spacer()
        }
    }
}


struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
