//
//  NetworkManager.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/8/23.
//

import Foundation

struct APIRequest: Codable {
    let prompt: String
    let max_tokens: Int
}

struct APIResponse: Codable {
    let object: String
    let created: Int
    let model: String
    let choices: [Choice]
}

struct Choice: Codable {
    let text: String
    let index: Int
    let logprobs: String?
    let finish_reason: String
}




class NetworkManager {
    let baseURL = "https://api.openai.com"
    
    func fetchResponse(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: baseURL + "/v1/engines/davinci/completions") else {
            print("URL is not correct") // Debug line
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestData = APIRequest(prompt: prompt, max_tokens: 60)
        
        do {
            let jsonData = try JSONEncoder().encode(requestData)
            request.httpBody = jsonData
        } catch {
            print("Failed to serialize JSON") // Debug line
            completion(.failure(error))
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error in dataTask: \(error)") // Print error to console
                completion(.failure(error))
            } else if let data = data {
                do {
                    // Output the raw JSON
                    print(String(data: data, encoding: .utf8) ?? "No readable data")
                    
                    let decodedData = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Decoded Data: \(decodedData)") // Print decoded data to console
                    if let firstChoice = decodedData.choices.first {
                        completion(.success(firstChoice.text))
                    } else {
                        print("Unable to parse response") // Debug line
                    }
                } catch {
                    print("Error in parsing JSON: \(error)") // Print error to console
                    completion(.failure(error))
                }
            } else {
                print("Data is nil") // Debug line
            }
        }
    }
}
