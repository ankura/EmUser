//
//  AppDelegate.swift
//  EmaarUsers
//
//  Created by Ankur Agarwal on 17/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        presentInitialViewController()
        // set up navigation bar colour
        setupNavigationBar()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        // Save changes in the application's managed object context when the application transitions to the background.
        DatabaseManager.savePersistedData();
        print("App Entered Background")
    }
    
  
  func  applicationDidReceiveMemoryWarning(_ application: UIApplication) {
      print("App Did Receive Memory Warning")
  }
    
    func presentInitialViewController() {
        
        let rootViewController = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "UserListVC")
        let navigationController = UINavigationController(rootViewController: rootViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }
    
    
    /// set up navigation bar for iOS 15 and above.
    func setupNavigationBar() {
      if #available(iOS 13.0, *) {
          let navigationBarAppearance = UINavigationBarAppearance()
          navigationBarAppearance.configureWithDefaultBackground()
          navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
          navigationBarAppearance.backgroundColor = .lightGray
          UINavigationBar.appearance().tintColor = .black
          UINavigationBar.appearance().standardAppearance = navigationBarAppearance
          UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
      }
    }

}

