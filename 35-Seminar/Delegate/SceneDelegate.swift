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
        
        let loginVC = LoginViewController()
        
        // 탭바 생성
        let tabBarVC = MainTabBarController()
        
        tabBarVC.setViewControllers([tabBarVC.todayVC, tabBarVC.gameVC, tabBarVC.appVC, tabBarVC.arcadeVC, tabBarVC.searchVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.selectedIndex = 2
        
        // 로그인 하면 탭바뷰로 변겨오디게 하는 코드 만들기
        
        self.window?.rootViewController = UINavigationController(rootViewController: loginVC)
        self.window?.makeKeyAndVisible()
        
    }
    
}
