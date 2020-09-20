//
//  AppDelegate.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/18/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit
//import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hasAlreadyLaunched :Bool!
    var checkPage :Bool!




    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Change the window's root view controller to be a UINavigationController.
        // This way, we can push new view controllers onto our navigation stack
        // and use multiple ViewControllers across our app.
        // The navigation controller must start off with a beginning view controller, or the root.
        // We want the root view controller to display our ViewController.
//        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        UITabBar.appearance().barTintColor = UIColor(hue: 258/360, saturation: 23/100, brightness: 92/100, alpha: 1.0)
//        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        hasAlreadyLaunched = UserDefaults.standard.bool(forKey: "hasAlreadyLaunched")
        checkPage = false
        
        
//        print(hasAlreadyLaunched)
        print(checkPage)

//        if (hasAlreadyLaunched){
//            hasAlreadyLaunched = true
//            window?.rootViewController = UINavigationController(rootViewController: TabBarController())
//        }else{
//            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
//            window?.rootViewController = UINavigationController(rootViewController: ViewController())
//
//        }
        if (checkPage){
            hasAlreadyLaunched = true
            checkPage = true
            print("went in here")
            window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        }else{
            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
            print("went in here false")
            checkPage = false
//            window?.rootViewController = UINavigationController(rootViewController: ViewController())
            window?.rootViewController = UINavigationController(rootViewController: TabBarController())

            
        }

        

        
        window?.makeKeyAndVisible()
        
//        FirebaseApp.configure()
        return true
    }
    func sethasAlreadyLaunched(){
        hasAlreadyLaunched = true
    }
    func changeRootController(animated: Bool = true){
        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
    }
    
    func setCheckPageFalse(){
        checkPage = false
    }
    
    func setCheckPageTrue(){
        checkPage = true
    }



    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

