//
//  AddExerciseDetailedView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 8/1/23.
//

import SwiftUI
import FirebaseAuth

struct AddExerciseDetailedView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var logViewModel: ExerciseLogViewModel
    let exercise: Exercise
    @State private var date = Date()
    @State private var minutes = "" // Change to String
    @State private var weight = "" // Change to String
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Text("Date: ")
                DatePicker("", selection: $date, displayedComponents: .date)
            }
            Divider()
            
            HStack {
                Text("Minutes: ")
                TextField("", text: $minutes)
                    .keyboardType(.numberPad)
            }
            Divider()
            
            HStack {
                Text("Your current weight: ")
                TextField("", text: $weight)
                    .keyboardType(.numberPad)
            }
            Divider()
        }
        .navigationTitle(exercise.name)
        .navigationBarItems(trailing: Button(action: {
                    if let minutesInt = Int(minutes), let weightInt = Int(weight) {
                        let newLog = ExerciseLog(id: UUID(), exercise: exercise, date: date, minutes: minutesInt, weight: weightInt, userID: Auth.auth().currentUser?.uid ?? "")
                        logViewModel.addLog(newLog)
                        showingAlert = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }) {
                    Text("Done")
                })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Success"), message: Text("Log saved successfully"), dismissButton: .default(Text("OK")))
                }
        .padding()
        Spacer()
    }
}
