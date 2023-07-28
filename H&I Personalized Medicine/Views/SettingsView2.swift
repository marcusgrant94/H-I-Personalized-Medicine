//
//  SettingsView2.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/17/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct SettingsView2: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @EnvironmentObject var usersViewModel: UsersViewModel
    let currentUser = Auth.auth().currentUser
    var user: User
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    showingImagePicker = true
                }) {
                    if let inputImage = inputImage {
                        Image(uiImage: inputImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(Circle())
                            .padding()
                    } else {
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .clipShape(Circle())
                            .padding()
                    }
                }
                Text(getUser()?.name ?? "Not Signed In")
                    .bold()
                    .offset(y: -18)
                Text(getUser()?.email ?? "Not Signed In")
                    .offset(y: -15)
                Spacer()
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Group {
                    Button {
                        do {
                            try Auth.auth().signOut()
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                    } label: {
                        Text("Log Out")
                    }
                }
            )
        }
    }
    
    func loadImage() {
            if let inputImage = inputImage {
                usersViewModel.uploadImage(inputImage, for: user)
            }
        }
    
    func getUser() -> User? {
        return usersViewModel.users.first { $0.id == currentUser?.uid }
    }
}

struct SettingsView2_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView2(user: User(id: "123", email: "email2@exapme.com", role: "patient", name: "Jane Doe", age: nil, height: nil, weight: nil)).environmentObject(UsersViewModel())
    }
}
