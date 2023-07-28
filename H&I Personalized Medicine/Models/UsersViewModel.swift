//
//  UsersViewModel.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/16/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

struct User: Identifiable {
    let id: String
    let email: String
    let role: String
    let name: String
    let age: Int?
    let height: Double?
    let weight: Double?
    // Add other properties if needed
}

class UsersViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var currentUserRole: String = ""
    @Published var adminUser: User?
    
    private var db = Firestore.firestore()
    
    // Computed property for all users except the current one
        var otherUsers: [User] {
            return users.filter { $0.id != Auth.auth().currentUser?.uid }
        }
    
    var nurseID: String? {
           return users.first(where: { $0.role == "admin" })?.id
       }
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if let user = user {
                // A user is signed in
                self?.fetchData(for: user.uid)
            } else {
                // No user is signed in
                self?.users = []
                self?.currentUserRole = ""
            }
        }

        }
    
    // Get the role of the currently logged-in user
        func getCurrentUserRole() {
            guard let userId = Auth.auth().currentUser?.uid else { return }
            db.collection("users").document(userId).getDocument { document, error in
                if let document = document, document.exists {
                    let data = document.data()
                    self.currentUserRole = data?["role"] as? String ?? ""
                } else {
                    print("Document does not exist: \(error?.localizedDescription ?? "")")
                }
            }
        }
    
    func fetchData(for uid: String) {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = documents.map { queryDocumentSnapshot -> User in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let role = data["role"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let age = data["age"] as? Int ?? 0
                let height = data["height"] as? Double ?? 0.0
                let weight = data["weight"] as? Double ?? 0.0
                
                // Check if this is the currently logged-in user
                if id == uid {
                    self.currentUserRole = role
                }
                
                return User(id: id, email: email, role: role, name: name, age: age, height: height, weight: weight)
            }
        }
    }



    
    func addUser(_ user: User) {
            let userData: [String: Any] = [
                "id": user.id,
                "email": user.email,
                "role": user.role,
                "name": user.name
            ]

            db.collection("users").document(user.id).setData(userData) { error in
                if let error = error {
                    print("Error adding user to Firestore: \(error)")
                } else {
                    print("User added to Firestore successfully.")
                    // Do any other actions you need to after adding the user to Firestore
                }
            }
        }
    
    func updateRole(ofUserWithID id: String, to role: String) {
        Firestore.firestore().collection("users").document(id).updateData([
            "role": role
        ]) { error in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
            } else {
                print("User role updated successfully.")
            }
        }
    }
    
    func deleteUser(_ user: User) {
        Firestore.firestore().collection("users").document(user.id).delete { err in
            if let err = err {
                print("Error removing user: \(err)")
            } else {
                print("User successfully removed!")
                self.fetchData(for: user.id) // Fetch the data again to refresh the view
            }
        }
    }
    
    func uploadImage(_ image: UIImage, for user: User) {
            guard let data = image.jpegData(compressionQuality: 0.5) else {
                // Handle error
                return
            }
            
            let storageRef = Storage.storage().reference().child("images/\(user.id).jpg")
            
            storageRef.putData(data, metadata: nil) { (metadata, error) in
                if let error = error {
                    // Handle error
                    print("Error uploading image: \(error)")
                    return
                }
                
                storageRef.downloadURL { (url, error) in
                    if let error = error {
                        // Handle error
                        print("Error getting download URL: \(error)")
                        return
                    }
                    
                    if let url = url {
                        // Save download URL to Firestore
                        let db = Firestore.firestore()
                        
                        db.collection("users").document(user.id).setData([
                            "imageUrl": url.absoluteString
                        ], merge: true) { error in
                            if let error = error {
                                print("Error saving image URL to Firestore: \(error)")
                                return
                            }
                        }
                    }
                }
            }
        }
    
    func updateUserProfile(userID: String, age: Int, height: Int, weight: Int, completion: @escaping (Error?) -> Void) {
        let userRef = db.collection("users").document(userID)
        userRef.updateData([
            "age": age,
            "height": height,
            "weight": weight
        ]) { error in
            if let error = error {
                print("Failed to update user profile: \(error)")
                completion(error)
            } else {
                print("User profile successfully updated!")
                completion(nil)
            }
        }
    }

}

