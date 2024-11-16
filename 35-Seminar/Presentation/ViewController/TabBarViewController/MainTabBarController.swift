//
//  MainTabBarController.swift
//  35-Seminar
//
//  Created by OneTen on 11/7/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // 탭 바 요소들
    let todayVC = UINavigationController(rootViewController: TodayViewController())
    let gameVC = UINavigationController(rootViewController: GameViewController())
    // let appVC = UINavigationController(rootViewController: AppViewController())
    let appVC = UINavigationController(rootViewController: FinanceViewController())
    let arcadeVC = UINavigationController(rootViewController: ArcadeViewController())
    let serverVC = UINavigationController(rootViewController: ServerViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }

    
    func setStyle() {
        self.setViewControllers([self.todayVC, self.gameVC, self.appVC, self.arcadeVC, self.serverVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        self.selectedIndex = 2
        
        // 탭 바 아이템 설정
        todayVC.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "doc.text.image"), tag: 0)
        gameVC.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: 1)
        appVC.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 2)
        arcadeVC.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "arcade.stick.console"), tag: 3)
        serverVC.tabBarItem = UITabBarItem(title: "서버", image: UIImage(systemName: "gearshape"), tag: 4)
        
    }
    
    
    
}
