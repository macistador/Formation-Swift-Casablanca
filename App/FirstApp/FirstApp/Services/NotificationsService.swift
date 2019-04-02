//
//  Notifications.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import UserNotifications

struct NotificationsService {

    static func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notifications permission granted.")
            }
            else {
                print("Notifications permission denied because: \(error?.localizedDescription).")
            }
        }
    }


    static func sendLocalNotification() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            guard settings.authorizationStatus == .authorized else { return }

            let content = UNMutableNotificationContent()
            content.categoryIdentifier = "myFirstApp.notifications.testLocal"
            content.title = "Ma notif locale"
            content.subtitle = "Demo d'une notification"
            content.body = "Ceci est le texte de la notification"
            content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}
