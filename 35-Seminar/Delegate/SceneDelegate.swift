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
        let tabBarVC = UITabBarController()
        
        // 탭 바 요소들
        let todayVC = TodayViewController()
        let gameVC = GameViewController()
        let appVC = AppViewController()
        let arcadeVC = ArcadeViewController()
        let searchVC = SearchViewController()
        
        // 탭 바 아이템 설정
        todayVC.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "doc.text.image"), tag: 0)
        gameVC.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: 1)
        appVC.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 2)
        arcadeVC.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "arcade.stick.console"), tag: 3)
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        
        tabBarVC.setViewControllers([todayVC, gameVC, appVC, arcadeVC, searchVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.selectedIndex = 2
        
//        let navigationController = UINavigationController(rootViewController: TossViewController())
        
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        
    }
    
}
