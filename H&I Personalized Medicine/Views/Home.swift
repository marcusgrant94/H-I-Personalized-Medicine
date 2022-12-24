//
//  Home.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI

struct Home: View {
    @ObservedObject var vm = CLoudKitUserAuthViewModel.shared
    
    @State private var showContactView = false
    @State private var showServicesView = false
    @Environment(\.openURL) var openURL
    private var email = SupportEmail(toAddress: "Info@hip-m.com", subject: "Inquiry Email")
    
    var body: some View {
        ZStack {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                Text("Welcome \(vm.userName)")
                        .fontWeight(.bold)
                }
                .frame(alignment: .leading)
                Image("H&I Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 115, height: 115)
                   
                
                Spacer()
                
                
            Text("Welcome to Hormones & Immunology Personalized Medicine")
                    .foregroundColor(Color(hue: 0.454, saturation: 0.991, brightness: 0.52, opacity: 0.911))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    Divider()
                Spacer()
                
                Group {
                
                HStack(spacing: 125) {
                Button(action: {

                }) {
                    Link("Register",
                          destination: URL(string: "https://hipm.livingmatrix.com/self_register_patients/new")!)
                }
                .foregroundColor(.black)
                .background(Capsule().stroke().foregroundColor(.black))
                .buttonStyle(.bordered)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .frame(maxWidth: 100, maxHeight: 140, alignment: .leading)
                .padding(5)
             
                    
                    
                    Button {
                        email.send(openURL: openURL)
                    } label: {
                        Text("Contact Us")
                    }
                    .foregroundColor(.black)
                    .background(Capsule().stroke().foregroundColor(.black))
                    .buttonStyle(.bordered)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                   
                   
                }
                
                Spacer()
                
//                HStack {
//                    VStack(alignment: .leading) {
                        HStack(spacing: 45) {
                        Text("Services We Provide:")//
                            Button(action: {
                                self.showServicesView.toggle()
                            }) {
                            Label("Show more", systemImage: "")
                            }.sheet(isPresented: $showServicesView) {
                                ServicesView()
                            }
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                        }
                            .font(.system(size: 21, weight: .bold))
                            .foregroundColor(.black)
            ScrollView(.horizontal) {
            LazyHStack {
                Link(destination: URL(string: "https://www.hip-m.com/services/")!) {
                    ProvidedServicesView()
                        .shadow(radius: 4)
                        .padding(8)
                        .foregroundColor(.black)
                }

                Link(destination: URL(string: "https://hipm.livingmatrix.com/self_register_patients/new")!) {
                    ProvidedServicesView2()
                        .shadow(radius: 4)
                        .padding(8)
                        .foregroundColor(.black)
                }

                Link(destination: URL(string: "https://www.hip-m.com/services/")!) {
                    ProvidedServicesView3()
                        .shadow(radius: 4)
                        .padding(8)
                        .foregroundColor(.black)
                }
                
                Link(destination: URL(string: "https://www.hip-m.com/services/")!) {
                    ProvidedServicesView4()
                        .shadow(radius: 4)
                        .padding(8)
                        .foregroundColor(.black)
                }
                
                Link(destination: URL(string: "https://www.hip-m.com/services/")!) {
                    ProvidedServicesView5()
                        .shadow(radius: 4)
                        .padding(8)
                        .foregroundColor(.black)
                }
                }
            }
                
            }
                Group {
                VStack() {
                    ConditionsTreatedView()
                }
//                        ScrollView(.horizontal) {
//                            HStack(spacing: 0.5) {
//                                    VStack {
//                                        Image("Services logo1")
//                                        VStack {
//                                            Text("Lab Tests")
//                                                .font(.system(size: 20, weight: .bold,design: .serif))
//                                                .foregroundColor(.black)
//
//                                            Spacer()
//
//                                        }
//                                    }
//                        .frame(width: 150)
//                        .background(Color.white)
//                        .cornerRadius(30)
//                        VStack {
//                            Button(action: {
//
//                            },label: {
//                                Image("Services logo2")
//                            })
//
//
//                                Text("""
//                                     Wellness
//                                     Assessment
//                                    """)
//                                    .font(.system(size: 20, weight: .bold,design: .serif))
//                                    .foregroundColor(.black)
//                            Spacer()
//
//                        }
//                        .frame(width: 200)
//                        .background(Color.white)
//                        .cornerRadius(30)
//                                VStack {
//                                    Image("Services logo3")
//                                    VStack {
//                                        Text("Comprehensive Health Approach")
//                                            .font(.system(size: 20, weight: .bold,design: .serif))
//                                            .foregroundColor(.black)
//                                        Spacer()
//
//                                    }
//                                }
//                                .frame(width: 200)
//                                .background(Color.white)
//                                VStack {
//                                    Image("Services logo4")
//                                    VStack {
//                                        Text("Personalized Treatment Plan")
//                                            .font(.system(size: 20, weight: .bold,design: .serif))
//                                            .foregroundColor(.black)
//                                        Spacer()
//
//                                    }
//                                }
//                                .frame(width: 250)
//                                .background(Color.white)
//                                VStack {
//                                    Image("Services logo5")
//                                    VStack {
//                                        Text("""
//                                             Analytical
//                                             Softwares
//                                            """)
//                                            .font(.system(size: 20, weight: .bold,design: .serif))
//                                            .foregroundColor(.black)
//                                        Spacer()
//
//
//
//                                    }
//                                }
//                                .frame(width: 135)
//                                .background(Color.white)
//                                .cornerRadius(30)
//
//
//                            }
//                        }
//                        Text("Conditions we treat:")
//                            .font(.system(size: 22, weight: .bold))
//                            .foregroundColor(.black)
//                            .padding()
//                        VStack(alignment: .leading, spacing: 8) {
//                            HStack(spacing: 5) {
//                            Image("bulletpoint")
//                        Text("Autoimmune")
//                        }
//                        HStack(spacing: 5) {
//                            Image("bulletpoint")
//                            Text("Hormonal Health")
//                        }
//                            HStack {
//                                Image("bulletpoint")
//                                Text("Metabolic Health")
//                            }
//                        HStack(spacing: 5) {
//                            Image("bulletpoint")
//                            Text("Cardiovascular Health")
//                        }
//                        HStack(spacing: 5) {
//                            Image("bulletpoint")
//                            Text("Dermatological Health")
//                        }
//                        HStack(spacing: 5) {
//                            Image("bulletpoint")
//                            Text("Weight Health")
//                        }
//                            HStack {
//                                Image("bulletpoint")
//                                Text("Inflammation")
//                            }
//                            HStack(spacing: 5) {
//                                Image("bulletpoint")
//                                Text("Digestive Health")
//                            }
//                            HStack(spacing: 5) {
//                                Image("bulletpoint")
//                                Text("Mental Health")
//                            }
//
//                        }
//                        .foregroundColor(Color(hue: 0.454, saturation: 0.991, brightness: 0.52, opacity: 0.911))
//
//
//            }
//        }
//
//                .padding(.leading, 30)
//
                
            
        }
            }
        }
    }
    }
//}

    


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
}
