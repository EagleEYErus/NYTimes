//
//  APIError.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import Foundation

enum APIError {
	case responseData
	case decodeData
	case unknown
	
	var localizedDescription: String {
		switch self {
		case .responseData:
			return "Ошибка загрузки данных"
		case .decodeData:
			return "Ошибка получения данных"
		case .unknown:
			return "Неизвестная ошибка"
		}
	}
}

extension APIError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .responseData:
			return "Ошибка загрузки данных"
		case .decodeData:
			return "Ошибка получения данных"
		case .unknown:
			return "Неизвестная ошибка"
		}
	}
}
