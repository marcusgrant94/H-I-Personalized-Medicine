//
//  ServicesView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
        ServicesList(services: Services.all)
    }
        .navigationTitle("Our Services")
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
