//
//  ExerciseView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/31/23.
//

import SwiftUI
import FirebaseAuth

struct ExerciseView: View {
    @ObservedObject var logViewModel: ExerciseLogViewModel
    let exercise: Exercise?
    var userID: String
    
    init(exercise: Exercise? = nil, logViewModel: ExerciseLogViewModel, userID: String) {
           self.exercise = exercise
           self.logViewModel = logViewModel
           self.userID = userID
       }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Divider()
            Text("Logs")
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
            
            List {
                ForEach(logViewModel.logs.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(logViewModel.logs[index].exercise.name)
//                        Text("Hello World")
                            .font(.subheadline)
                        Text("Date: \(dateFormatter.string(from: logViewModel.logs[index].date))")
                            .font(.subheadline)
                        Text("Minutes: \(logViewModel.logs[index].minutes)")
                            .font(.subheadline)
                        Text("Weight: \(logViewModel.logs[index].weight)")
                            .font(.footnote)
                    }
                }
                .onDelete(perform: deleteItem)
            }
            
            NavigationLink(destination: AddExerciseView(logViewModel: logViewModel)) {
                Text("+ Add Exercise")
            }
            .padding()
            Divider()
            Spacer()
        }
        .navigationTitle("Exercise")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            logViewModel.userID = userID
////            logViewModel.fetchLogs(forUserID: userID)
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let log = logViewModel.logs[index]
            print("Attempting to delete log with ID: \(log.id)")
            logViewModel.delete(log)
        }
    }

}

