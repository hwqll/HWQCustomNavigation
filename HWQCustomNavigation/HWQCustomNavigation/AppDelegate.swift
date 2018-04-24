//
//  AppDelegate.swift
//  HWQCustomNavigation
//
//  Created by hwq on 2018/4/20.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabbar : HWQTabbarController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        
        UIApplication.shared.statusBarStyle = .lightContent
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        
        tabbar = stroyboard.instantiateViewController(withIdentifier: "HWQTabbarController") as! HWQTabbarController
        tabbar.delegate = self
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        
        return true
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
//MARK: - 选中第4个tabbaritem时调用判断是否登陆
extension AppDelegate : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController == tabBarController.viewControllers?.last {
            let userIsLogin = UserDefaults.standard.bool(forKey: "userIsLogin")
            if !userIsLogin {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginRegister = storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
                let nav = HWQNaviController(rootViewController: loginRegister)
                //present到login时设置true
                UserDefaults.standard.setValue(true, forKey: "presentLoginRegister")
                self.tabbar.present(nav, animated: true, completion: nil)
            }
            return false
        }
        return true
        
    }
        
        
}

