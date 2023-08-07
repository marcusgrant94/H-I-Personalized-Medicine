//
//  AddExerciseView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/31/23.
//

import SwiftUI
import FirebaseAuth

struct AddExerciseView: View {
    @StateObject var viewModel = ExerciseViewModel()
    @State private var searchText = ""
    @ObservedObject var logViewModel: ExerciseLogViewModel
    
    init(logViewModel: ExerciseLogViewModel) {
        self.logViewModel = logViewModel
    }

    var body: some View {
        List {
            ForEach(viewModel.groupedExercises.keys.sorted(), id: \.self) { muscle in
                Section(header: Text(muscle)) {
                    ForEach(getFilteredExercises(for: muscle), id: \.self) { exercise in
                        exerciseView(exercise)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Exercises")
        .onAppear {
            viewModel.loadExercises()
//            print("Exercises loaded: \(viewModel.groupedExercises)")
//            logViewModel.fetchLogs(forUserID: Auth.auth().currentUser?.uid ?? "")
        }
//        .onDisappear {
//            print("AddExerciseView disappeared")
//        }
    }

    // Get filtered exercises for a given muscle group
    private func getFilteredExercises(for muscle: String) -> [Exercise] {
        let exercisesForMuscle = viewModel.groupedExercises[muscle] ?? []
        let filteredExercises = exercisesForMuscle.filter {
            self.searchText.isEmpty ? true : $0.name.localizedStandardContains(self.searchText)
        }
        return filteredExercises
    }

    // Create view for a given exercise
    private func exerciseView(_ exercise: Exercise) -> some View {
        NavigationLink(destination: AddExerciseDetailedView(logViewModel: logViewModel, exercise: exercise)) {
            VStack(alignment: .leading) {
                Text(exercise.name)
                    .font(.headline)
                Text(exercise.type)
                    .font(.subheadline)
                Text("Difficulty: \(exercise.difficulty)")
                    .font(.footnote)
            }
        }
    }
}

