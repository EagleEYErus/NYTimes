//
//  Builder.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import UIKit

protocol BuilderProtocol {
	static func createTabController() -> UIViewController
}


final class Builder: BuilderProtocol {
	static func createTabController() -> UIViewController {
		let tabController = UITabBarController()
		tabController.tabBar.tintColor = .orange

		let emailedViewController = createEmailedViewController()
		let sharedViewController = createSharedViewController()
		tabController.viewControllers = [emailedViewController, sharedViewController]
		
		return tabController
	}
	
	private static func createEmailedViewController() -> UIViewController {
		let view = EmailedViewController()
		let urlService = URLService().append(endpoint: .emailed)
		let networkService = NetworkService(urlService: urlService)
		let navigationController = UINavigationController(rootViewController: view)
		let router = DetailRouter(navigationController: navigationController)
		let presenter = EmailedPresenter(view: view, networkService: networkService, router: router)
		view.presenter = presenter
		return navigationController
	}
	
	private static func createSharedViewController() -> UIViewController {
		let view = SharedViewController()
		let urlService = URLService().append(endpoint: .shared)
		let networkService = NetworkService(urlService: urlService)
		let navigationController = UINavigationController(rootViewController: view)
		let router = DetailRouter(navigationController: navigationController)
		let presenter = SharedPresenter(view: view, networkService: networkService, router: router)
		view.presenter = presenter
		return navigationController
	}
}
