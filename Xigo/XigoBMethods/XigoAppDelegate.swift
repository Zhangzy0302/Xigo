
import UIKit
import UserNotifications
import FBSDKCoreKit

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        registerPush(application)

        return true
    }

    private func registerPush(_ application: UIApplication) {

        UNUserNotificationCenter.current().delegate = self

        application.registerForRemoteNotifications()

        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge]
        ) { granted, error in

            if granted {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
        }
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {

        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()

        // 保存
        WqigjxAkjjglriAppStorage.wqigjxAkjjglriPushToken = token
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print("Push 注册失败:", error)
    }
}
