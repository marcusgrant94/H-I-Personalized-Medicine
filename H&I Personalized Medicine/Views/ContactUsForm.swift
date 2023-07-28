//
//  ContactUsForm.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/18/22.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContactUsForm: View {
    @State private var viewModel = MapViewModel()
    
    let locations = [
        Location(name: "Test", coordinate: CLLocationCoordinate2D(latitude: 39.44609, longitude: -76.81628)),
    ]
    
    var body: some View {
        Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true, annotationItems: locations) { location in
            MapMarker(coordinate: location.coordinate) 
        }
        .accentColor(Color(.systemBlue))
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
        }
        
        
    }
}

struct ContactUsForm_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsForm()
    }
}

