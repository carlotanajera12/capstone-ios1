//
//  SceneDelegate.swift
//  CollegeSuccessToolkit3
//
//  Created by Carlota Najera on 4/22/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Make sure window exists (Storyboard already creates it)
        if let window = self.window,
           let tabBarController = window.rootViewController as? UITabBarController,
           let viewControllers = tabBarController.viewControllers,
           !viewControllers.isEmpty,
           let motivationNavController = viewControllers[0] as? UINavigationController {

            let motivationVC = MotivationViewController()
            motivationNavController.setViewControllers([motivationVC], animated: false)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
