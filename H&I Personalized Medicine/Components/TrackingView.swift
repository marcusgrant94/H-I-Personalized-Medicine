//
//  TrackingView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/24/23.
//

import SwiftUI

struct TrackingView: View {
    let name: String
    let image: String
    let waterLogViewModel: WaterLogViewModel
    let userID: String
    
    var body: some View {
        if name == "Water" {
            AnyView(NavigationLink(destination: WaterLogsView(waterLogViewModel: waterLogViewModel)) {
                Tracking(imageName: image, caption: name)
            })
        } else if name == "Weight" {
            AnyView(NavigationLink(destination: WeightEntryView(userID: userID)) {
                Tracking(imageName: image, caption: name)
            })
        } else {
            AnyView(Button(action: {}) {
                Tracking(imageName: image, caption: name)
            })
        }
    }
}



struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView(name: "dummyName", image: "dummyImage", waterLogViewModel: WaterLogViewModel(userID: "dummyUserID"), userID: "dummyUserID")
    }
}

