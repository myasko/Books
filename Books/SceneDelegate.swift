//
//  SceneDelegate.swift
//  Books
//
//  Created by Георгий Бутров on 11.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .dark
        }
        
        let homeVC = HomeViewController()
        
        let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = Colors.background2
        tabBar.tabBar.tintColor = UIColor(hex: "76708E")
        tabBar.tabBar.alpha = 0.7
        
        let navHome = UINavigationController(rootViewController: homeVC)
        let iconHome = UITabBarItem(title: "Главная", image: UIImage(named: "home"), tag: 0)
        navHome.tabBarItem = iconHome
        
        let compVC = SearchViewController()
        let navComp = UINavigationController(rootViewController: compVC)
        let iconComp = UITabBarItem(title: "Поиск", image: UIImage(named: "search"), tag: 1)
        navComp.tabBarItem = iconComp
        
        let basketVC = CartViewController()
        let navBasket = UINavigationController(rootViewController: basketVC)
        let iconBasket = UITabBarItem(title: "Корзина", image: UIImage(named: "basket"), tag: 2)
        navBasket.tabBarItem = iconBasket
        
        let profileVC = ProfileViewController()
        let navProfile = UINavigationController(rootViewController: profileVC)
        let iconProfile = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 3)
        navProfile.tabBarItem = iconProfile
        
        
        tabBar.viewControllers = [navHome, navComp, navBasket, navProfile]
        
        let authVC = AuthorizationViewController()
        navHome.pushViewController(authVC, animated: false)
        
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

