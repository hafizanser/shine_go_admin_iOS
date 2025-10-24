//
//  AppDelegate.swift
//  ShineGo_Admin_iOS
//
//  Created by Asad Hamza on 20/10/2025.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FirebaseMessaging
import FirebaseCore
import Firebase
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let app = UIApplication.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        requestNotificationAuthorization(application: app)
        Messaging.messaging().delegate = self
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

//MARK: - UNUserNotificatioCenter Delegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken as Data
    }
    
    func requestNotificationAuthorization(application: UIApplication) {
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { (isSuccess, error) in
                if let error = error {
                    print("error",error.localizedDescription)
                } else {
                    print("After Allow Tapped")
                }
            })
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        let current = UNUserNotificationCenter.current()
        
        current.getNotificationSettings(completionHandler: { (settings) in
            if settings.authorizationStatus == .notDetermined {
                print("ass")
                // Notification permission has not been asked yet, go for it!
            } else if settings.authorizationStatus == .denied {
                // Notification permission was previously denied, go to settings & privacy to re-enable
                print("ass")
            } else if settings.authorizationStatus == .authorized {
                //if UserDefaults.standard.bool(forKey: UserDefaultKeys.isFirstTimeNotificationPopup){}
            }
        })
        
        application.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[K.MESSAGE_ID] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[K.MESSAGE_ID] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        //print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    // Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo
        print(userInfo)
        
        if let notificationType = userInfo[K.ORDER_ID] {
            print("Message ID: \(notificationType)")
            if notificationType as! String != "" {
                print("notificationType inside")
                let bookingModel = getBookingNotificationRecieveModel(userInfo: userInfo as! [String : Any])
                NotificationCenter.default.post(name: .NOTIFICATION_RECEIVED, object: nil, userInfo: [NotificationKeys.NOTIFICATION_USERINFO: bookingModel])
                
//                if let topVC = UIApplication.shared.visibleViewController {
//                    print("FeedbackPopUpVC = \(FeedbackPopUpVC.self)")
//                    if topVC.isKind(of: FeedbackPopUpVC.self) {
//                        completionHandler([.sound, .badge])
//                    } else {
//                        completionHandler([.list, .banner, .sound, .badge])
//                    }
//                }
                completionHandler([.list, .banner, .sound, .badge])
            } else {
                print("notificationType outside")
                let notificationModel = getNotificationRecieveModel(userInfo: userInfo as! [String : Any])
                NotificationCenter.default.post(name: .MESSAGE_RECEIVED, object: nil, userInfo: [NotificationKeys.NOTIFICATION_USERINFO: notificationModel])
                if let topVC = UIApplication.shared.visibleViewController {
                    print("topVC = \(topVC)")
                    if topVC.isKind(of: HomesVC.self) {
                        completionHandler([.sound, .badge])
                    } else {
                        completionHandler([.list, .banner, .sound, .badge])
                    }
                }
                completionHandler([.list, .banner, .sound, .badge])
            }
        }
        
    }
    
    // Called when the user taps on a notification when the app is in the foreground or background.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let messageID = userInfo[K.MESSAGE_ID] {
            print("Message ID: \(messageID)")
        }
        if let orderId = userInfo[K.ORDER_ID] {
            let bookingModel = getBookingNotificationRecieveModel(userInfo: response.notification.request.content.userInfo as! [String : Any])
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                NotificationCenter.default.post(name: .NOTIFICATION_CLICKED, object: nil, userInfo: [NotificationKeys.NOTIFICATION_USERINFO: bookingModel])
            }
            completionHandler()
        }
    }
    
    private func getBookingNotificationRecieveModel(userInfo:[String:Any]) -> NotificationBookingModel {
        
        let dict = userInfo["aps"] as! NSDictionary
        let messageBody:String?
        if let alertDict = dict["alert"] as? Dictionary<String, String> {
            messageBody = alertDict["body"]
        } else {
            messageBody = dict["alert"] as? String
        }
        let orderID = Int((userInfo[NotificationKeys.ORDER_ID] as? String) ?? "") ?? 0
        let model = NotificationBookingModel.init(orderId: orderID)
        return model
        
    }
    
    private func getNotificationRecieveModel(userInfo:[String:Any]) -> NotificationModel {
        
        let dict = userInfo["aps"] as! NSDictionary
        let messageBody:String?
        if let alertDict = dict["alert"] as? Dictionary<String, String> {
            messageBody = alertDict["body"]
        } else {
            messageBody = dict["alert"] as? String
        }
        let notificationType = (userInfo[NotificationKeys.NOTIFICATION_TYPE] as? String) ?? ""
        let model = NotificationModel.init(notificationType: notificationType)
        return model
    }

}

//MARK:   MessagingDelegate
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        NSLog("[RemoteNotification] didRefreshRegistrationToken: \(fcmToken ?? "")")
        print("FCM TOKEN = ", fcmToken ?? "")
        let dataDict:[String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        UserDefaults.standard.setValue(fcmToken ?? "", forKey: K.KFCM_TOKEN)
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        NSLog("[RemoteNotification] didRefreshRegistrationToken: \(fcmToken)")
        print("FCM TOKEN = ", fcmToken)
        UserDefaults.standard.setValue(fcmToken, forKey: K.KFCM_TOKEN)
    }
}

