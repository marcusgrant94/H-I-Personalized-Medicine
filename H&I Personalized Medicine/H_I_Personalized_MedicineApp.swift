//
//  H_I_Personalized_MedicineApp.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 5/14/22.
//

import SwiftUI
import FirebaseCore
import UserNotifications
import CloudKit
//import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
    // Register for remote notifications
    registerForPushNotifications(application)
    
    return true
  }
  
  func registerForPushNotifications(_ application: UIApplication) {
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
        guard granted else { return }
        DispatchQueue.main.async {
            application.registerForRemoteNotifications()
        }
    }
  }
    
    

  // Handle remote notification registration.
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("Application registered for remote notifications.")
  }

  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Failed to register for remote notifications: \(error.localizedDescription)")
  }
 
  
  // MARK: - UNUserNotificationCenterDelegate
  
  // Handle display notification in foreground
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.banner, .sound])
  }
  
  // Handle user interaction with the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo

        // Check if it is a CloudKit notification
        if let notification = CKNotification(fromRemoteNotificationDictionary: userInfo as! [String : NSObject]),
           let queryNotification = notification as? CKQueryNotification,
           let recordID = queryNotification.recordID {
                let container = CKContainer(identifier: "iCloud.random.H-I-Personalized-Medicine")
                container.publicCloudDatabase.fetch(withRecordID: recordID) { (record, error) in
                    if let record = record {
                        // Here, you can examine the record to see what kind of update has occurred
                    } else if let error = error {
                        print("Error fetching record: \(error.localizedDescription)")
                    }
                }
        }

        completionHandler()
    }
}



@main
struct H_I_Personalized_MedicineApp: App {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var usersViewModel = UsersViewModel()
    @StateObject var exerciseLogViewModel = ExerciseLogViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel()).environmentObject(usersViewModel)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                                    UIApplication.shared.applicationIconBadgeNumber = 0
                                }
//            NewAccountView().environmentObject(AuthViewModel())
//            LogInView().environmentObject(authViewModel)
//            ChatView(recipientID: "SampleRecipientID").environmentObject(UsersViewModel())
//            ExerciseView(logViewModel: exerciseLogViewModel)
//            AddExerciseDetailedView()
            
        }
    }
}
