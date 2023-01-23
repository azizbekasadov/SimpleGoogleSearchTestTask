//
//  DiscoverTVAdapter.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

protocol DiscoverTVAdapterDelegate: AnyObject {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
}

final class DiscoverTVAdapter: NSObject {
    private weak var tableView: UITableView!
    
    private weak var delegate: DiscoverTVAdapterDelegate?
    
    private var items: [BookEntity] = []
    
    init(_ tableView: UITableView, delegate: DiscoverTVAdapterDelegate? = nil) {
        self.tableView = tableView
        self.delegate = delegate
        
        super.init()
    }
    
    private func configureViews() {
        tableView.register(DiscoverBookTVCell.self,
                           forCellReuseIdentifier: DiscoverBookTVCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureWith(_ items: [BookEntity]) {
        self.items = items
        
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension DiscoverTVAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.tableView(tableView, didSelectRowAt: indexPath)
    }
}

extension DiscoverTVAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverBookTVCell.identifier,
                                                 for: indexPath) as! DiscoverBookTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.TableView.estimatedHeightForRowAt
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DiscoverTVAdapter {
    fileprivate enum Constants {
        enum TableView {
            static let estimatedHeightForRowAt: CGFloat = 110.0
        }
    }
}
