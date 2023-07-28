//
//  LogInView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/13/23.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("LaunchPhoto2")
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Welcome to Hormones & Immunology Personalized Medicine")
                    .padding()
                
                TextField("Email", text: $email)
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
                
                if let errorMessage = errorMessage {
                                   Text(errorMessage)
                                       .foregroundColor(.red)
                               }

                Button(action: {
                    authViewModel.signIn(email: email, password: password) { success, error in
                        if success {
                            errorMessage = nil
                        } else {
                            errorMessage = error ?? "Incorrect email or password"
                        }
                    }
                }) {
                                   Text("Sign In")
                                       .font(.headline)
                                       .foregroundColor(.white)
                                       .padding()
                                       .frame(maxWidth: 350)
                                       .background(Color.green)
                                       .cornerRadius(8.0)
                               }
                HStack {
                    NavigationLink(destination: NewAccountView()) {
                                Text("Create Account")
                            }
                            .buttonStyle(PlainButtonStyle())
                    .offset(x: -40, y: 13)
                    NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot Password?")
                            }
                            .buttonStyle(PlainButtonStyle())
                    .offset(x: 50, y: 15)
                    
                }
                
                Image("signin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 245)
                    .offset(y: 15)
                
                Spacer()
            }
        }
                }
            }

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
