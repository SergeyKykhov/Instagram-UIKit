//
//  TabBarController.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabController()

    }

    // метода настривает сам TabBar цвет иконок и цвет фона бара
    func setupTabController() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        setupTabBarViewControllers()
    }

    // метод подготавливает ViewControllers для добавления их в TabBarController
    func setupTabBarViewControllers() {
        let feedViewController = FeedViewController()
        let feedViewControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        feedViewController.tabBarItem = feedViewControllerIcon
   

        let searchViewController = SearchViewController()
        let searchViewControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        searchViewController.tabBarItem = searchViewControllerIcon


        let newPublicationViewController = NewPublicationViewController()
        let newPublicationViewControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "plus.app.fill"), selectedImage: UIImage(systemName: "plus.app.fill"))
        newPublicationViewController.tabBarItem = newPublicationViewControllerIcon

        let ReelsViewController = ReelsViewController()
        let ReelsViewControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "play.square"), selectedImage: UIImage(systemName: "play.square.fill"))
        ReelsViewController.tabBarItem = ReelsViewControllerIcon


        let ProfileViewController = ProfileViewController()
        let ProfileViewControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle.fill"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        ProfileViewController.tabBarItem = ProfileViewControllerIcon

        let controllers = [feedViewController, searchViewController, newPublicationViewController, ReelsViewController, ProfileViewController]
        self.setViewControllers(controllers, animated: true)
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Будет выбран контроллер - \(viewController.title ?? "")")
        return true
    }



}

