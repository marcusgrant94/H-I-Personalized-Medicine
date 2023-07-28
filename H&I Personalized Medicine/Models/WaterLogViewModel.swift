//
//  WaterLogVieModel.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/20/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct WaterLog {
    let date: Date
    let unit: String
    let amount: String
}


class WaterLogViewModel: ObservableObject {
    @Published var logs: [WaterLog] = []
    private var db = Firestore.firestore()
    let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    func addWaterLog(forUserWithID id: String, logEntry: WaterLog) {
        let waterLogData: [String: Any] = [
            "date": logEntry.date,
            "unit": logEntry.unit,
            "amount": logEntry.amount
        ]
        
        db.collection("users").document(id).collection("waterLogs").addDocument(data: waterLogData) { error in
            if let error = error {
                print("Error adding water log to Firestore: \(error)")
            } else {
                print("Water log added to Firestore successfully.")
                self.fetchWaterLogs(forUserWithID: id)
            }
        }
    }
    
    func fetchWaterLogs(forUserWithID id: String) {
        db.collection("users").document(id).collection("waterLogs").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.logs = documents.map { queryDocumentSnapshot -> WaterLog in
                let data = queryDocumentSnapshot.data()
                let date = data["date"] as? Timestamp
                let unit = data["unit"] as? String ?? ""
                let amount = data["amount"] as? String ?? ""
                
                return WaterLog(date: date?.dateValue() ?? Date(), unit: unit, amount: amount)
            }
        }
    }
    
    
}



