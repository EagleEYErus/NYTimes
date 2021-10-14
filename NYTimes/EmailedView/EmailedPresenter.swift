//
//  EmailedPresenter.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

protocol EmailedViewProtocol: AnyObject {
	func success()
}

protocol EmailedPresenterProtocol: AnyObject {
	var articles: [Article] { get }
	init(view: EmailedViewProtocol, networkService: NetworkService, router: DetailRouter)
	func getArticles()
}

final class EmailedPresenter: EmailedPresenterProtocol {
	
	weak var view: EmailedViewProtocol?
	let networkService: NetworkService
	let router: DetailRouterProtocol
	
	var articles: [Article] = []
	
	init(view: EmailedViewProtocol, networkService: NetworkService, router: DetailRouter) {
		self.view = view
		self.networkService = networkService
		self.router = router
		
		getArticles()
	}
	
	func getArticles() {
		networkService.request { [weak self] (result: Result<Response, APIError>) in
			switch result {
			case .success(let response):
				self?.articles = response.results
				self?.view?.success()
			case .failure:
				break
			}
		}
	}
}
