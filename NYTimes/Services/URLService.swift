//
//  URLService.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import Alamofire

struct URLService {
	private(set) var additionalPath: String = ""
	private(set) var parameters: Parameters?
	
	private var sourcePath: String {
		return "https://api.nytimes.com/svc/mostpopular/v2/"
	}

	var fullPath: String {
		return self.sourcePath + self.additionalPath
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	func append(endpoint: Endpoint) -> URLService {
		var model = self
		model.additionalPath += "/" + endpoint.rawValue + "?api-key=\(Constants.apiKey)"
		return model
	}
	
	enum Endpoint: String {
		case emailed = "emailed/30.json"
		case shared = "shared/30.json"
		case viewed = "viewed/30.json"
	}
}
