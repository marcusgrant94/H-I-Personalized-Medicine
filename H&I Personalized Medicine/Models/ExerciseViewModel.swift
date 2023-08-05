//
//  ExerciseViewModel.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/31/23.
//

import Foundation


struct Exercise: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
}




struct ExerciseData: Decodable {
    let exercises: [Exercise]
}

class ExerciseViewModel: ObservableObject {
    @Published var exercises = [Exercise]()
    @Published var groupedExercises: [String: [Exercise]] = [:]
    let muscleGroups = ["abdominals", "abductors", "adductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "triceps"]
    
    func loadExercises() {
        for muscle in muscleGroups {
            let muscleEncoded = muscle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscleEncoded ?? "")")!
            var request = URLRequest(url: url)
            request.setValue("XfeoNBevVgkFd1BR50fUdw==YY9GYScKUWPOSfAt", forHTTPHeaderField: "X-Api-Key")
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                guard let self = self else { return }
                do {
                    if let data = data {
                        let exercises = try JSONDecoder().decode([Exercise].self, from: data)
                        DispatchQueue.main.async {
                            self.exercises.append(contentsOf: exercises)
                            self.groupedExercises = Dictionary(grouping: self.exercises, by: { $0.muscle })
                        }
                    } else if let error = error {
                        print("HTTP Request Failed: \(error)")
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            }
            
            task.resume()
        }
    }
}





