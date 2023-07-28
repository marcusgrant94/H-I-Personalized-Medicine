//
//  VisitStoreView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 3/16/23.
//

import SwiftUI
import FirebaseAuth

struct VisitStoreView: View {
    let storeURL = "https://hipm.fmforlife.com/"
    
    var body: some View {
        VStack {
            Image("LaunchPhoto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 200)
                .padding(.top, 50)
            
            Text("Visit Our Store")
                .font(.title)
                .fontWeight(.bold)
            
            Button {
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
            } label: {
                Text("Log Out")
            }
            Text("Welcome to our online store! Browse our selection of products and find something you love.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .padding(.horizontal, 50)
            
            Button(action: {
                if let url = URL(string: self.storeURL) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Go to Store")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 30)
            }
            Spacer()
        }
    }
}

struct VisitStoreView_Previews: PreviewProvider {
    static var previews: some View {
        VisitStoreView()
    }
}

