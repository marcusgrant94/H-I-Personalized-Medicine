//
//  SettingsView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/14/23.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @EnvironmentObject var usersViewModel: UsersViewModel
    let currentUser = Auth.auth().currentUser
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

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
                
                Text(getUser()?.name ?? "Not Signed in")
                    .bold()
                    .padding(.horizontal)
                Text(getUser()?.email ?? "Not Signed in")
                    .padding(.horizontal)
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
    
    func getUser() -> User? {
        return usersViewModel.users.first { $0.id == currentUser?.uid }
    }
    
    func loadImage() {
        // Here you can do something with the selected image
    }
}







struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(UsersViewModel())
    }
}
