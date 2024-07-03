//
//  AppDelegate.swift
//  Zelmooni
//
//  Created by 문인범 on 6/27/24.
//

import UIKit
import FirebaseCore

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("firebase configured!")
        
        return true
    }
}
