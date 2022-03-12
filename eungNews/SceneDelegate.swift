//
//  SceneDelegate.swift
//  eungNews
//
//  Created by 김응철 on 2022/03/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: NewsListViewController())
        window?.backgroundColor = .systemBackground
        window?.tintColor = .systemOrange
        window?.makeKeyAndVisible()
    }
}
