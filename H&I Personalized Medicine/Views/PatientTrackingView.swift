//
//  PatientTrackingView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/19/23.
//

import SwiftUI

struct PatientTrackingView: View {
    let userID: String
    @StateObject var waterLogViewModel: WaterLogViewModel

    init(userID: String) {
        self.userID = userID
        self._waterLogViewModel = StateObject(wrappedValue: WaterLogViewModel(userID: userID))
    }

    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    let componetList = [
           componets(name: "Water", image: "waterdrop"),
           componets(name: "Weight", image: "scale"),
           componets(name: "Excersize", image: "dumbells")
       ]
    
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(componetList.indices, id: \.self) { index in
                                TrackingView(name: componetList[index].name, image: componetList[index].image, waterLogViewModel: waterLogViewModel, userID: self.userID)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Tracking")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

struct PatientTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        PatientTrackingView(userID: "dummyUserID")
    }
}
