//
//  NetworkService.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import Alamofire
import Foundation

final class NetworkService {
	
	private let urlService: URLService
	
	init(urlService: URLService) {
		self.urlService = urlService
	}
	
	func request<T: Decodable>(completion: ((Swift.Result<T, APIError>) -> Void)?) {
		let headers: HTTPHeaders = ["Content-Type": "application/json"]
		AF.request(urlService.fullPath,
				   method: urlService.method,
				   parameters: urlService.parameters,
				   encoding: JSONEncoding.default,
				   headers: headers)
			.responseJSON { (response) in
				
				guard let value = response.data else {
					completion?(.failure(.responseData))
					return
				}
				
				let decoder = JSONDecoder()
				do {
					let data = try decoder.decode(T.self, from: value)
					completion?(.success(data))
				} catch {
					completion?(.failure(.decodeData))
				}
			}.responseString { (response) in
				#if DEBUG
				print(response)
				#endif
			}
	}
}
