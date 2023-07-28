//
//  Tracking.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/19/23.
//

import SwiftUI

struct Tracking: View {
    let imageName: String
    let caption: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text(caption)
                .font(.system(size: 20))
                .bold()
        }
    }
}

struct Tracking_Previews: PreviewProvider {
    static var previews: some View {
        Tracking(imageName: "test", caption: "test")
    }
}
