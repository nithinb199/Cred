//
//  SceneDelegate.swift
//  Cred
//
//  Created by Nithin B on 27/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func createAddMoneyVC() -> UINavigationController{
        let addMoneyVC          = AddMoneyVC()
        let addMoneyImage       = UIImage(named: "AddMoney")
        addMoneyVC.tabBarItem   = UITabBarItem(title: nil, image: addMoneyImage, tag: 1)
        return UINavigationController(rootViewController: addMoneyVC)
    }
    
    func createHomeVC() -> UINavigationController{
        let homeVC          = HomeVC()
        let homeImage       = UIImage(named: "Home")
        homeVC.tabBarItem   = UITabBarItem(title: nil, image: homeImage, tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createCardsVC() -> UINavigationController{
        let cardsVC         = CardsVC()
        let cardsImage      = UIImage(named: "Cards")
        cardsVC.tabBarItem  = UITabBarItem(title: nil, image: cardsImage, tag: 4)
        return UINavigationController(rootViewController: cardsVC)
    }
    
    func createNewsLetterVC() -> UINavigationController{
        let newsLetterVC            = NewsLetterVC()
        let newsLetterImage         = UIImage(named: "NewsLetter")
        newsLetterVC.tabBarItem     = UITabBarItem(title: nil, image: newsLetterImage, tag: 3)
        return UINavigationController(rootViewController: newsLetterVC)
    }
    
    func createUnicornVC() -> UINavigationController{
        let unicornVC = UnicornVC()
        let unicornImage = UIImage(named: "Unicorn")
        unicornVC.tabBarItem = UITabBarItem(title: nil, image: unicornImage, tag: 2)
        return UINavigationController(rootViewController: unicornVC)
    }
    
    func createTabBarController() -> UITabBarController{
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createHomeVC(),createAddMoneyVC(),createUnicornVC(),createNewsLetterVC(),createCardsVC()]
        return tabBar
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

