//
//  EmailedViewController.swift
//  NYTimes
//
//  Created by Александр Сапрыкин on 14.10.2021.
//

import UIKit
import SnapKit

final class EmailedViewController: UIViewController {
	
	var presenter: EmailedPresenterProtocol!
	
	var tableView: UITableView!
	
	init() {
		super.init(nibName: nil, bundle: nil)

		tabBarItem.title = "Emailed"
		tabBarItem.image = .init(systemName: "envelope")
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
		title = "Emailed"

		tableView = UITableView()
		tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "EmailedCell")
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
}

extension EmailedViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

extension EmailedViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.articles.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmailedCell", for: indexPath) as? ArticleTableViewCell else {
			return UITableViewCell()
		}
		
		let article = presenter.articles[indexPath.row]
		cell.titleLabel.text = article.title
		cell.publishedDateLabel.text = article.publishedDate
		return cell
	}
}

extension EmailedViewController: EmailedViewProtocol {
	func success() {
		tableView.reloadData()
	}
}
