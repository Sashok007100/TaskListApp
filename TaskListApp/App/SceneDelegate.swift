//
//  SceneDelegate.swift
//  TaskListApp
//
//  Created by Alexandr Artemov (Mac Mini) on 28.07.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private let storageManager = StorageManager.shared
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: TaskListViewController())
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        storageManager.saveContext()
    }
}
