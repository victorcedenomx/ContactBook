//
//  AppDelegate.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import CoreData
import UIKit

@main
class AppDelegate: UIResponder {
    
    // MARK: Internal properties
    
    var window: UIWindow?
    
    // MARK: Private functions
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UINavigationController(rootViewController: MenuController())
        window?.makeKeyAndVisible()
    }
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Save changes in the application's managed object context when the application transitions to the background.
        CoreDataManager.sharedInstance.saveContext()
    }
}
