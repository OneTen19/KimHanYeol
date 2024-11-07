//
//  SceneDelegate.swift
//  35-Seminar
//
//  Created by OneTen on 10/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        // 탭바 생성
        let tabBarVC = MainTabBarController()
        
        tabBarVC.setViewControllers([tabBarVC.todayVC, tabBarVC.gameVC, tabBarVC.appVC, tabBarVC.arcadeVC, tabBarVC.searchVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.selectedIndex = 2
        
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        
    }
    
}
