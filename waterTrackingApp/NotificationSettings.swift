//
//  NotificationSettings.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 25/04/1446 AH.
//

import SwiftUI
// عطي الفنكنشن باراميتر وناديها هناك وجوا الباراميتر نادي الفاريبل اللي يخزن 

class NotificationManger: ObservableObject {
    @Published var chossenInterval: Int?
    
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
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false) // how often does the notification pop and how many it repeat
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
}

struct NotificationSettings: View {
    var body: some View {
        VStack {
            Button("Request permission") {
                NotificationManger.notifiInstance.requestNotification()
            }
//            Button("S"){
//                NotificationManger.notifiInstance.ScheduleNotification()
//            }
        }
    }
}

#Preview {
    NotificationSettings()
}
