//
//  DetailRouter.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import UIKit

protocol DetailRouterProtocol {
	func detailContoller() -> UIViewController
}

final class DetailRouter: DetailRouterProtocol {
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func detailContoller() -> UIViewController {
		return UIViewController()
	}
}
