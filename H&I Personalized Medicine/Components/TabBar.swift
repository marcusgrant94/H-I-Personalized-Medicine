//
//  TabBar.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AboutUsView()
                .tabItem {
                    Label("About Us", systemImage: "person.2.fill")
                }
            
            ServicesView()
                .tabItem {
                    Label("Services", systemImage: "cross.case.fill")
                }
            
            IndividualProductView()
                .tabItem {
                    Label("Store", systemImage: "cart")
                }
            
            ContactUsView()
                .tabItem {
                    Label("Contact Us", systemImage: "envelope.fill")
                }
            
            FaqView()
                .tabItem {
                    Label("FAQs", systemImage: "envelope.fill")
                }
            
        }
        .accentColor(Color(hue: 0.454, saturation: 0.991, brightness: 0.52, opacity: 0.911))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
