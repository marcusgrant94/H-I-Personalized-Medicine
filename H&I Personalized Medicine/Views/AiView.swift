//
//  AiView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/8/23.
//

import SwiftUI

struct AiView: View {
    @State private var responseText = "Ask something..."
    @State private var promptText = ""
    private let networkManager = NetworkManager()

    var body: some View {
        VStack {
            TextField("Enter your question here", text: $promptText)
                .padding()
                .border(Color.gray)
            
            Button("Ask GPT-3") {
                print("Button tapped")
                networkManager.fetchResponse(prompt: promptText) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let response):
                            responseText = response
                            print("Success: \(response)") // Add this line to print the response in console
                        case .failure(let error):
                            responseText = error.localizedDescription
                            print("Error: \(error.localizedDescription)") // Add this line to print the error in console
                        }
                    }
                }
            }
            .padding()
            
            Text(responseText)
                .padding()
        }
    }
}



struct AiView_Previews: PreviewProvider {
    static var previews: some View {
        AiView()
    }
}
