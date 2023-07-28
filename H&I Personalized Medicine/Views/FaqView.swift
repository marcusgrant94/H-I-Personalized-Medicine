//
//  FaqView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 8/6/22.
//

import SwiftUI

struct FaqView: View {
    @State private var Question1 = 0
    let question1 = [
        "",
    "Does HIPM Take Insurance?"
    ]
    var body: some View {
        NavigationView {
        VStack {
            
                DisclosureGroup("Does HIPM take insurance?") {
                    Text("HIPM uses many modalities that are not covered by insurance. HIPM is happy to provide a superbill for rendered services which can be used to seek reimbursement of some or all services.")
                }
            
                DisclosureGroup("How much does your services cost?") {
                    Text("Please contact us for more information.")
                }
            
                DisclosureGroup("Can visits be done via telehealth?") {
                    Text("Depending on the condition, many times, the initial visit must be completed in person. However, some services, such as Health coaching and follow-up visits, can be done via telehealth. For more details, you can ask us anything via call or email.")
                }
            Group {
                DisclosureGroup("Does HIPM provide primary care services?") {
                    Text("No, HIPM does not provide primary care services. You will need to engage a primary care provider for primary care services.")
                }
            
                DisclosureGroup("What form of payment is accepted?") {
                    Text("Credit and debit cards are accepted. HIPM uses a payment processor that offers 3, 6, and 9-month payment plans, giving you the option to incrementally pay your purchase.")
                }
           
                DisclosureGroup("Does HIPM dispense the supplements or medications?") {
                    Text("Depending on the specific supplement or medication, it may be available in office, at the pharmacy of your choice, or it may be shipped to you.")
                }
            }
            
            Group {
            DisclosureGroup("How does HIPM personalize my care?") {
                Text("The initial screenings and assessments determine the intervention and treatment. Based on these, specific types of laboratory tests are recommended in order to further understand your particular health state. Once your current health state is understood, treatment recommendations are customized to support your recovery. Customized recommendations can include specialized diet, nutritional supplements that are manufactured specifically for your needs, remote monitoring of biological markers, and more.")
            }
                
            DisclosureGroup("Why are the screenings so lengthy? Are they really necessary?") {
                Text("The screenings are designed to allow you to tell your story as it relates to your health. It asks questions regarding your past and current health events, environmental exposures, and symptoms. Your current health state is a culmination of your entire life experiences. Therefore, the screenings ask specific questions designed to capture important lifelong information that help to explain your current health state and lay the foundation for recovery.")
            }
                
            DisclosureGroup("Why do I have to take the brief initial screening before scheduling an appointment?") {
                Text("Once you complete the Brief Initial Screening which is free of charge, a telehealth appointment will be scheduled with you to review the findings. During this appointment, you will be shown a graphic presentation of your health analysis that identifies areas of concern.")
            }
                
                DisclosureGroup("Does HIPM conduct the recommended laboratory testing in office?") {
                    Text("No. Depending on the test, you may visit a nearby laboratory specimen collection location or have a phlebotomist visit your home or location of your choice for your convenience (additional fees may apply).")
                }
                Spacer()
            }
            
        }
        .padding()
        .navigationTitle("FAQs")
        }
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
}
