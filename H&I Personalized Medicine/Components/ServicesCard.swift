//
//  ServicesCard.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/19/22.
//

import SwiftUI

struct ServicesCard: View {
    var services: Services
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: services.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(services.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 7, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding(25)
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                    Text(services.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 7, x: 0, y: 0)
                        .frame(maxWidth: 136)
                        .padding()
                }
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct ServicesCard_Previews: PreviewProvider {
    static var previews: some View {
        ServicesCard(services: Services.all[1])
    }
}
