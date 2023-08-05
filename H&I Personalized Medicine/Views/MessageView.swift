//
//  MessageView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/24/23.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
            HStack {
                if message.isCurrentUser {
                    Spacer()
                    Text(message.text)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(ChatBubble(isFromCurrentUser: message.isCurrentUser))
                } else {
                    Text(message.text)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(ChatBubble(isFromCurrentUser: message.isCurrentUser))
                    Spacer()
                }
            }
        }
    }

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight],
                                cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}
