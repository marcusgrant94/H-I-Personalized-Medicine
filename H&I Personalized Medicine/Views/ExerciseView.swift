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
    let userID: String
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
//        NavigationView {
            VStack {
                Divider()
                Text("Logs")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                
                List {
                    ForEach(logViewModel.logs) { log in
                        VStack(alignment: .leading) {
                            Text(log.exercise.name)
                                .font(.headline)
                            Text("Date: \(dateFormatter.string(from: log.date))")
                                .font(.subheadline)
                            Text("Minutes: \(log.minutes)")
                                .font(.subheadline)
                            Text("Weight: \(log.weight)")
                                .font(.footnote)
                        }
                    }
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
                if let userID = Auth.auth().currentUser?.uid {
                    logViewModel.fetchLogs(forUserID: userID)
                }
            }
        
            
//        }
    }
}
