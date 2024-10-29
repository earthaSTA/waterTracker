//
//  NotificationSettings.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 25/04/1446 AH.
//

import SwiftUI
import UserNotifications


class NotificationManger: ObservableObject {
    @Published var chossenInterval: Int?
    @Published var chossenHourInterval: Int?
    
    static let notifiInstance = NotificationManger()

    func requestNotification() { // request notification pop up
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print(("\(error)"))
            }
            else {
                print("success")
            }
            
        }
    }
    
    
    func ScheduleNotification(IntervalChoice interval: TimeInterval ) {
        // Notification look and sound
        let content = UNMutableNotificationContent()
        content.title = "Drink water!"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval * 60, repeats: true) // how often does the notification pop and how many it repeat
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
}
