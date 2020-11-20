//
//  LocalNotificationManager.swift
//  ISA_APP_FinalProject
//
//  Created by Miranda Ramirez Cospin on 11/20/20.
//

import UIKit
import Foundation
import UserNotifications

class LocalNotificationManager {
    var notifications = [Notification]()
    
    private func requestAuthorization()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in

            if granted == true && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    func schedule()
    {
        UNUserNotificationCenter.current().getNotificationSettings { settings in

            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break // Do nothing
            }
        }
    }
    
    private func scheduleNotifications()
    {
        for notification in notifications
        {
            let content      = UNMutableNotificationContent()
            content.title    = notification.title
            content.sound    = .default

            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.datetime, repeats: false)
            //Other types of triggers
            //trigger = UNTimeIntervalNotificationTrigger(timeInterval: 120, repeats: false)
            //trigger = UNLocationNotificationTrigger(triggerWithRegion: region, repeats: false)

            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in

                guard error == nil else { return }

                print("Notification scheduled! --- ID = \(notification.id)")
            }
        }
    }
    
    
    
}

struct Notification {
    var id:String
    var title:String
    var datetime:DateComponents
}

func listScheduledNotifications()
{
    UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in

        for notification in notifications {
            print(notification)
        }
    }
}





