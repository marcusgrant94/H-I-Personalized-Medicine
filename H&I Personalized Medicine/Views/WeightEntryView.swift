//
//  WeightEntryView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/24/23.
//

import SwiftUI
import FirebaseFirestore

struct WeightEntry: Identifiable {
    let id = UUID()
    var weight: Double
    var height: Double
    var age: Int
}




struct WeightEntryView: View {
    let userID: String
    @State var weightEntry = WeightEntry(weight: 0.0, height: 0.0, age: 0)
    @State var heightFeet: Int = 0
    @State var heightInches: Int = 0
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Weight")) {
                    TextField("Enter your weight", value: $weightEntry.weight, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Height")) {
                    HStack {
                        TextField("Feet", value: $heightFeet, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 50)
                        Text("Feet")
                        TextField("Inches", value: $heightInches, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 50)
                        Text("Inches")
                    }
                }
                Section(header: Text("Age")) {
                    TextField("Enter your age", value: $weightEntry.age, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                .navigationTitle("Weight/Height/Age")
                .navigationBarTitleDisplayMode(.inline)
            }
            Button {
                let totalHeightInInches = (heightFeet * 12) + heightInches
                let db = Firestore.firestore()
                let userData: [String: Any] = ["weight": weightEntry.weight,
                                               "height": totalHeightInInches,
                                               "age": weightEntry.age]
                db.collection("users").document(userID).setData(userData, merge: true)
                showingAlert = true
            } label: {
                Text("Submit")
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Submitted Successfully"),
                  message: Text("Your information has been submitted successfully"),
                  dismissButton: .default(Text("OK")))
        }
    }
}


