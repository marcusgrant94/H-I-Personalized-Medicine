//
//  SupportEmail.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 6/11/22.
//

import Foundation
import SwiftUI


struct SupportEmail {
    let toAddress: String
    let subject: String
    var data: Data?
    var body: String {"""
        
    """
    }
    
    func send(openURL: OpenURLAction) {
        let urlString = "mailto:\(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        guard let url = URL(string: urlString) else { return }
        openURL(url) { accepted in
            if !accepted {
                print("""
                This device does not support email
                \(body)
                """
                )
            }
        }
    }
    
}
