//
//  SharedViewController.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import UIKit

final class SharedViewController: UIViewController {

	var presenter: SharedPresenterProtocol!
	
	var tableView: UITableView!
	
	init() {
		super.init(nibName: nil, bundle: nil)

		tabBarItem.title = "Shared"
		tabBarItem.image = .init(systemName: "square.and.arrow.up")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		makeUI()
	}
	
	func makeUI() {
		view.backgroundColor = .white
		title = "Shared"

		tableView = UITableView()
		tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "SharedCell")
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
}

extension SharedViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

extension SharedViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.articles.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "SharedCell", for: indexPath) as? ArticleTableViewCell else {
			return UITableViewCell()
		}
		
		let article = presenter.articles[indexPath.row]
		cell.titleLabel.text = article.title
		cell.publishedDateLabel.text = article.publishedDate
		return cell
	}
}

extension SharedViewController: SharedViewProtocol {
	func success() {
		tableView.reloadData()
	}
}
