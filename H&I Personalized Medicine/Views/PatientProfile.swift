//
//  PatientProfile.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/17/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct PatientProfile: View {
    
    @EnvironmentObject var usersViewModel: UsersViewModel
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var weight: Double = 0.0
    @State private var height: Double = 0.0
    @State private var age: Int = 0
    @State private var heightFeet: Int = 0
    @State private var heightInches: Int = 0
    
    var user: User
    
    var body: some View {
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
                        } else if let profileImageURL = user.profileImageURL, let url = URL(string: profileImageURL) {
                            URLImage(url: url)
                                
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
                Text(user.name)
                    .bold()
                    .offset(y: -18)
                Text(user.email)
                    .offset(y: -15)
                Divider()
                HStack() {
                    Text("Weight: \(String(format: "%g", weight))")
                    Text("Height: \(heightFeet) feet \(heightInches) inches")
                    Text("Age: \(age)")
                }
                .onAppear {
                    fetchUserData()
                }
                Divider()
                Group {
                    NavigationLink(destination: WaterLogsView(waterLogViewModel: WaterLogViewModel(userID: user.id))) {
                        Text("Water Tracker")
                    }
                    Divider()
                    NavigationLink(destination: WaterLogsView(waterLogViewModel: WaterLogViewModel(userID: user.id))) {
                        Text("Water Tracker")
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .navigationTitle("Patient Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink(destination: ChatView(recipientID: user.id)) {
                Image(systemName: "bubble.right.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            })
                }
    
    func fetchUserData() {
           let db = Firestore.firestore()
           db.collection("users").document(user.id).getDocument { (document, error) in
               if let document = document, document.exists {
                   self.weight = document.data()?["weight"] as? Double ?? 0.0
                   self.height = document.data()?["height"] as? Double ?? 0.0
                   self.age = document.data()?["age"] as? Int ?? 0
                   
                   // convert height in inches to feet and inches
                   self.heightFeet = Int(self.height) / 12
                   self.heightInches = Int(self.height) % 12
               } else {
                   print("Document does not exist")
               }
           }
       }
    
    
    func loadImage() {
        // Here you can do something with the selected image
    }
}

//struct PatientProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        PatientProfile(user: User(id: "124", email: "email@example.com", role: "patient", name: "John Doe", age: 20, height: 180, weight: 75)).environmentObject(UsersViewModel())
//    }
//}

