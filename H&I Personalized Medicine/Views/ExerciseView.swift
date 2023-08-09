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
        VStack(spacing: 20) {
            Text("Logs")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(logViewModel.logs.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(logViewModel.logs[index].exercise.name)
                            .font(.headline)
                            .padding(.vertical, 5)
                        
                        Text("Date: \(dateFormatter.string(from: logViewModel.logs[index].date))")
                            .font(.subheadline)
//                            .foregroundColor(.secondary)
                        
                        Text("Minutes: \(logViewModel.logs[index].minutes)")
                            .font(.subheadline)
//                            .foregroundColor(.secondary)
                        
                        Text("Weight: \(logViewModel.logs[index].weight)")
                            .font(.footnote)
//                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 10)
                }
                .onDelete(perform: deleteItem)
            }
            
            NavigationLink(destination: AddExerciseView(logViewModel: logViewModel)) {
                HStack {
                    Image(systemName: "plus") // Adds a plus icon from SF Symbols
                        .foregroundColor(.white)
                    Text("Add Exercise")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)  // You can choose your desired color
                .cornerRadius(10)
            }
            .padding([.bottom, .horizontal])
        }
        .navigationTitle("Exercise")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            logViewModel.updateUserID(userID)
            printLogs()
        }

    }
    
    
    private func printLogs() {
        logViewModel.logs.forEach { log in
            print("Exercise: \(log.exercise)")
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

