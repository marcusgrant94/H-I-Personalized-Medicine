//
//  ServicesModel.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/19/22.
//

import Foundation


struct Services: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
}


extension Services {
    static let all: [Services] = [
    Services(name: "Wellness Assessment", description: "Wellness requires a calm, composed mind and a physical body that is in balance. HIPM wellness screenings and assessments are thoroughly conducted in efforts to identify imbalances. Call or email today to inquire about our wellness assessment or other services.", image: "https://agelessrx.com/wp-content/uploads/The-AgelessRx-Personalized-Wellness-Assessment.png"),

    Services(name: "Comprehensive Health", description: "HIPM uses evidenced based madicine to guide healthcare delivery. All services are delivered based on sudies condcted by top researchers in the field.", image: "https://www.findlawimages.com/content/original-images/purchasing%20pills-online-laptop.jpg"),
    
    Services(name: "Lab Tests", description: "Testing or screening techniques that assess the quality of your blood cells, inflammatory cells, hormones, genes, gut microbiome, and others important markers are included in our laboratory services. Your test samples are evaluated by a lab technician or your HIPM clinician to see whether they are within the normal range. Because no two people are the same, laboratories employ several methods to analyze your findings. We can arrange various tests from our connected laboratories if patients need them. This eliminates the need for a second trip to the lab and the associated time and inconvenience.  A wide range of main testing capabilities are available  and we may provide our clients with options unavailable at other laboratories in the area.", image: "https://daveasprey.com/wp-content/uploads/2018/11/lab-tests_header.jpg"),
    
    Services(name: "Analytical Softwares", description: "Over the last several years, predictive modeling has been improved as well as its ability to help improve day-to-day operations and patient care. At HIPM, we utilize both data sets to observe trends and make forecasts about your health.", image: "https://s3.amazonaws.com/mentoring.redesign/s3fs-public/GettyImages-636670168_downsized.jpg"),
    
    ]
}
