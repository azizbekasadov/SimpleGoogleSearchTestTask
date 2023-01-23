//
//  DiscoverTableView.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit
import Stevia

final class DiscoverTableView: UIView {
    typealias DiscoverTableViewDelegate = DiscoverTVAdapterDelegate
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.contentInsetAdjustmentBehavior = .always
        return tableView
    }()
    
    private lazy var adapter = DiscoverTVAdapter(tableView,
                                                 delegate: delegate)
    
    weak var delegate: DiscoverTableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        // Unnecessary to decode the objects and encode them here, since I don't use Storyboards;
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        subviews(tableView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        tableView.fillContainer()
    }
    
    func configureWith(_ items: [BookEntity]) {
        self.adapter.configureWith(items)
    }
}
