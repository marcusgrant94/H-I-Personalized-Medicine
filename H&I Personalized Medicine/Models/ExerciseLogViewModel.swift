//
//  ExerciseLogViewModel.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 8/1/23.
//

import SwiftUI
import Foundation
import FirebaseFirestore


struct ExerciseLog: Identifiable, Codable {
    let id: UUID
    let exercise: Exercise
    let date: Date
    let minutes: Int
    let weight: Int
    var userID: String
    // ...
}


extension ExerciseLog {
    var data: [String: Any] {
        return [
            "id": id.uuidString,
            "exerciseName": exercise.name,
            "exerciseType": exercise.type,
            "exerciseDifficulty": exercise.difficulty,
            "exerciseMuscle": exercise.muscle,
            "exerciseEquipment": exercise.equipment,
            "exerciseInstructions": exercise.instructions,
            "date": date,
            "minutes": minutes,
            "weight": weight,
            "userID": userID
        ]
    }
}


class ExerciseLogViewModel: ObservableObject {
    @Published var logs = [ExerciseLog]()
    let db = Firestore.firestore()
    var listener: ListenerRegistration?
    @Published var userID: String {
        didSet {
//            fetchLogs(forUserID: userID)
        }
    }
    
    // Manually defined exercises
       let exercises = [
           Exercise(name: "Dumbbell Bench Press", type: "strength", muscle: "chest", equipment: "dumbbell", difficulty: "intermediate", instructions: "Lie down on a flat bench..."),
           Exercise(name: "Squats", type: "strength", muscle: "legs", equipment: "barbell", difficulty: "intermediate", instructions: "Stand with feet shoulder-width apart..."),
           // Add more exercises here
       ]

    init(userID: String) {
        self.userID = userID
//        fetchLogs(forUserID: userID) // Fetch logs on initialization
        listenForChanges()

    }
    
    deinit {
            listener?.remove()
        }
    
    init() {
        self.userID = ""
    }
    
    func delete(_ log: ExerciseLog) {
        guard let index = logs.firstIndex(where: { $0.id == log.id }) else { return }
        let docRefPath = db.collection("users").document(log.userID).collection("exerciseLogs").document(log.id.uuidString)
        docRefPath.delete { err in
            if let err = err {
                print("Error removing log: \(err)")
            } else {
                print("Log successfully removed!")
                DispatchQueue.main.async {
                    if index < self.logs.count {
                        self.logs.remove(at: index) // Remove log from local array
                    }
                }
            }
        }
    }







    
    func listenForChanges() {
        listener = db.collection("users").document(userID).collection("exerciseLogs").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error getting logs: \(error)")
            } else {
                self.logs = querySnapshot?.documents.compactMap { document in
                    let data = document.data()
                    
                    let exerciseID = UUID()
                    
                    let exercise = Exercise(
//                        id: exerciseID,
                        name: data["exerciseName"] as? String ?? "",
                        type: data["exerciseType"] as? String ?? "",
                        muscle: data["exerciseMuscle"] as? String ?? "",
                        equipment: data["exerciseEquipment"] as? String ?? "",
                        difficulty: data["exerciseDifficulty"] as? String ?? "",
                        instructions: data["exerciseInstructions"] as? String ?? ""
                    )
                    let date = data["date"] as? Date ?? Date()
                    let minutes = data["minutes"] as? Int ?? 0
                    let weight = data["weight"] as? Int ?? 0
                    
                    // Get the ID from the document's ID
                    let id = UUID(uuidString: document.documentID) ?? UUID()
                    
                    return ExerciseLog(
                        id: id,  // <-- Add this line
                        exercise: exercise,
                        date: date,
                        minutes: minutes,
                        weight: weight,
                        userID: data["userID"] as? String ?? ""
                    )
                } ?? []
            }
        }
    }


    func fetchLogs(forUserID userID: String) {
        // Do nothing. The logs will be fetched by the snapshot listener.
    }





    
    func addLog(_ log: ExerciseLog) {
        do {
            let docData = try FirestoreEncoder().encode(log)
            db.collection("users").document(log.userID).collection("exerciseLogs").document(log.id.uuidString).setData(docData) { err in
                if let err = err {
                    print("Error adding log: \(err)")
                } else {
                    print("Log successfully written!")
                }
            }
        } catch {
            print("Error encoding log: \(error)")
        }
    }

    func updateUserID(_ userID: String) {
        self.userID = userID
        // Fetch logs or any other necessary action
    }




//    private func saveLog(_ log: ExerciseLog) {
//        do {
//            let _ = try db.collection("exerciseLogs").addDocument(data: log.data)
//        } catch let error {
//            print("Error writing log to Firestore: \(error)")
//        }
//    }

//    func fetchLogs(forUserID userID: String) {
//        db.collection("users").document(userID).collection("exerciseLogs").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting logs: \(error)")
//            } else {
//                self.logs = querySnapshot?.documents.compactMap { document in
//                    let data = document.data()
//                    let exercise = Exercise(
//                        name: data["exerciseName"] as? String ?? "",
//                        type: data["exerciseType"] as? String ?? "",
//                        muscle: data["exerciseMuscle"] as? String ?? "",
//                        equipment: data["exerciseEquipment"] as? String ?? "",
//                        difficulty: data["exerciseDifficulty"] as? String ?? "",
//                        instructions: data["exerciseInstructions"] as? String ?? ""
//                    )
//                    let date = data["date"] as? Date ?? Date()
//                    let minutes = data["minutes"] as? Int ?? 0
//                    let weight = data["weight"] as? Int ?? 0
//
//                    return ExerciseLog(
//                        exercise: exercise,
//                        date: date,
//                        minutes: minutes,
//                        weight: weight,
//                        userID: data["userID"] as? String ?? ""
//                    )
//
//                } ?? []
//            }
//        }
//    }
    
    struct FirestoreEncoder {
        func encode<T: Encodable>(_ value: T) throws -> [String: Any] {
            let encoder = JSONEncoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            encoder.dateEncodingStrategy = .formatted(dateFormatter)
            let data = try encoder.encode(value)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dictionary ?? [:]
        }
    }

}





