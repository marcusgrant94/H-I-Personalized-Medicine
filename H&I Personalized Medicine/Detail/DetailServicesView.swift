//
//  DetailServicesView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/19/22.
//

import SwiftUI

struct DetailServicesView: View {
    var services: Services
    var phoneNumber = "410-220-5600"
    @Environment(\.openURL) var openURL
    var email = SupportEmail(toAddress: "lmagruder@hip-m.com", subject: "Inquiry Email")
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: services.image)) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            
            VStack(spacing: 30) {
                Text(services.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 10) {
                    if !services.description.isEmpty {
                        Text(services.description)
                    }
                }
                .padding()
                
                VStack {
                HStack(spacing: 60) {
                    Button(action: {
                        let phone = "tel://"
                        let phoneNumberformatted = phone + phoneNumber
                        guard let url = URL(string: phoneNumberformatted) else { return }
                        UIApplication.shared.open(url)
                    }) {
                        VStack {
                    Image("phoneIcon2")
                            Text("Call")
                                .foregroundColor(.black)
                                .frame(height: 25)
                        }
                    }
                    Button(action: {
                        email.send(openURL: openURL)
                    }) {
                        VStack {
                        Image("mailIcon2")
                            Text("Email")
                                .foregroundColor(.black)
                                .frame(height: 30)
                        }
                    }
                }
                }
                
            }
            .frame(maxWidth: 400, alignment: .leading)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}


struct DetailServicesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailServicesView(services: Services.all[0])
    }
}
