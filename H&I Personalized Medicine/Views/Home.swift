//
//  Home.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct Home: View {
    
    @State private var showContactView = false
    @State private var showServicesView = false
    @Environment(\.openURL) var openURL
    private var email = SupportEmail(toAddress: "Info@hip-m.com", subject: "Inquiry Email")
    @EnvironmentObject var usersViewModel: UsersViewModel
    let currentUser = Auth.auth().currentUser
    
    var body: some View {
        ZStack {
        ScrollView {
            VStack {
                Image("H&I Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 115, height: 115)
                   
                
                Spacer()
                
                
                Text(" " + greetingTime())
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
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
            
        }
            }
        }
    }
    }
    
    func greetingTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        
        // Use this line to get the current time in 12-hour format
        formatter.dateFormat = "h:mm a"
        // If you prefer 24-hour format, you can use the following line instead
        // formatter.dateFormat = "HH:mm"

        let currentTime = formatter.string(from: date)

        let hour = Calendar.current.component(.hour, from: Date())
        let greeting: String

        switch hour {
        case 6..<12 : greeting = "Good Morning"
        case 12..<17 : greeting = "Good Afternoon"
        case 17..<22 : greeting = "Good Evening"
        default: greeting = "Good Night"
        }

        return "\(greeting), \((getUser()?.name) ?? "")\n It's currently \(currentTime)"
    }

        // Function to return the current user
        func getUser() -> User? {
            return usersViewModel.users.first { $0.id == currentUser?.uid }
        }
    }

    


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UsersViewModel())
    }
}
