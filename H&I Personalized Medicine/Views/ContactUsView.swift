//
//  ContactUsView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI

struct ContactUsView: View {
    var phoneNumber = "410-220-5600"
    @Environment(\.openURL) var openURL
    private var email = SupportEmail(toAddress: "Info@hip-m.com", subject: "Inquiry Email")
    
    var body: some View {
        NavigationView {
        VStack {
            HStack {
                VStack {
            Image("locationIcon2")
            Text("Address")
                        .fontWeight(.bold)
                    Button(
                      """
                    100 Owings Court
                    Suite 12,
                    Reisterstown, MD 21136
                    """,
                      action: {
                          let latitude = 39.44609
                          let longitude = -76.81628
                          let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                          if UIApplication.shared.canOpenURL(url!) {
                              UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                          }
                          
                      }
                    )
                    .foregroundColor(Color(hue: 0.454, saturation: 0.991, brightness: 0.52, opacity: 0.911))
                    
                    Image("open1")
                    Text("Hours of Operation")
                        .fontWeight(.bold)
                    Text("By appointment only")
                        .foregroundColor(Color(hue: 0.454, saturation: 0.991, brightness: 0.52, opacity: 0.911))
                }
                
                HStack {
                VStack {
                Image("phoneIcon2")
                    Text("Phone Number")
                        .fontWeight(.bold)
                    Button(action: {
                        let phone = "tel://"
                        let phoneNumberformatted = phone + phoneNumber
                        guard let url = URL(string: phoneNumberformatted) else { return }
                        UIApplication.shared.open(url)
                       }) {
                       Label("(410)-220-5600", systemImage: "")
                               .padding(.horizontal)
                               .foregroundColor(Color(hue: 0.454, saturation: 0.991, brightness: 0.52, opacity: 0.911))
                       }
                       .frame(height: 60)

                    HStack {
                        Image("mailIcon2")
                    }
                    Text("Email")
                        .fontWeight(.bold)
                    Button {
                        email.send(openURL: openURL)
                    } label: {
                        Label("Info@hip-m.com", systemImage: "")
                            
                    }
                    
                }
            }
            }
        ContactUsForm()
            
        }
        .navigationTitle("Location")
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
