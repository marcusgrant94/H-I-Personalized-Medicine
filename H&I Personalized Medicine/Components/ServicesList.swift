//
//  ServicesList.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/19/22.
//

import SwiftUI

struct ServicesList: View {
    
    var services: [Services]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(services.count) \(services.count > 1 ? "Services" : "service")")
                    .font(.headline)
                    .fontWeight(.medium)
                .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(services) { services in
                    NavigationLink(destination: DetailServicesView(services: services)) {
                        ServicesCard(services: services)
                    }
                    .foregroundColor(.red)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct ServicesList_Previews: PreviewProvider {
    static var previews: some View {
        ServicesList(services: Services.all)
    }
}
