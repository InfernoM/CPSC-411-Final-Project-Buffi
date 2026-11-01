//
//  SceneDelegate.swift
//  Buffi
//
//  Created by user299489 on 10/31/26.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Scene Setup

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {

        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        // Create the application's window
        let window = UIWindow(windowScene: windowScene)

        // Create the Home screen
        let homeVC = HomeViewController()

        // Embed Home inside a Navigation Controller
        let navigationController = UINavigationController(
            rootViewController: homeVC
        )

        // Configure navigation appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance

        navigationController.navigationBar.tintColor = .systemBlue
        navigationController.navigationBar.prefersLargeTitles = true

        // Set Home as the starting screen
        window.rootViewController = navigationController

        // Force dark mode
        window.overrideUserInterfaceStyle = .dark

        // Display the window
        self.window = window
        window.makeKeyAndVisible()
    }

    // Scene Lifecycle

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}


