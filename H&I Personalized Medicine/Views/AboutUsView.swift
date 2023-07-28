//
//  AboutUsView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI
import MessageUI

struct AboutUsView: View {
    @Environment(\.openURL) var openURL
    private var email = SupportEmail(toAddress: "lmagruder@hip-m.com", subject: "Inquiry Email")
    var phoneNumber = "410-220-5600"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 1) {
                    Spacer()
                    Text("Our founder | LaVon Magruder")
                        .fontWeight(.bold)
                        .padding()
                    
//                    Image("SelfiePlaceholder")
//                        .resizable()
//                        .frame(width: 95, height: 95)
//                                .clipShape(Circle())
//                                .shadow(radius: 10)
            
                    Text("LaVon Magruder")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: 560, alignment: .center)
                    
                    Text("Nurse Practitioner")
                    
                    HStack {
                    Button {
                        email.send(openURL: openURL)
                    } label: {
                        Label("Email", systemImage: "envelope.fill")
                    }
                    .foregroundColor(.white)
                    .background(Color(hue: 0.823, saturation: 0.883, brightness: 0.449, opacity: 0.911))
                    .buttonStyle(.bordered)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .frame(maxWidth: .infinity, maxHeight: 116, alignment: .topLeading)
                    .padding(30)
                        .navigationTitle("About Us")
                    
                    Button(action: {
                        let phone = "tel://"
                        let phoneNumberformatted = phone + phoneNumber
                        guard let url = URL(string: phoneNumberformatted) else { return }
                        UIApplication.shared.open(url)
                       }) {
                       Label("Call", systemImage: "phone")
                       }
                    .foregroundColor(.white)
                    .background(Color(hue: 0.823, saturation: 0.883, brightness: 0.449, opacity: 0.911))
                    .buttonStyle(.bordered)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .frame(maxWidth: .infinity, maxHeight: 1, alignment: .trailing)
                    .padding(50)
                    }
                    
                    Text("LaVon has worked in healthcare for more than two decades. Her understanding of the importance of nutrition, vitamins, minerals, herbs, and hormones has grown throughout her professional career. As a result, LaVon has tailored her education and professional experience to include these approaches in her work with patients dealing with long-term health issues. LaVon is a graduate of Georgetown University’s Family Nurse Practitioner program. She holds a master’s degree in Herbal Product Development and Manufacturing from Maryland University and Integrative Health; and is currently pursuing her master’s degree in Nutrition and Functional Medicine from Western States University.")
                        .padding(.horizontal)
                    
                    Spacer(minLength: 30)
                    
                    
                
                    
        
                    
                }
            }
        }
    }

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
}
