//
//  Response.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

struct Response: Decodable {
	let status, copyright: String
	let numResults: Int
	let results: [Article]

	enum CodingKeys: String, CodingKey {
		case status, copyright
		case numResults = "num_results"
		case results
	}
}
