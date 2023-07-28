//
//  NotificationManager.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/27/23.
//

import Foundation
import CloudKit
import UIKit
import SwiftUI

class NotificationManager {
    static let shared = NotificationManager()
    var unreadCount = 0 {
        didSet {
            UIApplication.shared.applicationIconBadgeNumber = unreadCount
        }
    }

    func receivedNewNotification() {
        unreadCount += 1
    }

    func didOpenNotification() {
        if unreadCount > 0 {
            unreadCount -= 1
        }
    }
}
