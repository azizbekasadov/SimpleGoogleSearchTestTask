//
//  DiscoverViewController.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit
import Stevia

protocol DiscoverDisplayLogic: AnyObject {
    func initialSetup(viewModel: DiscoverModels.InitData.ViewModel)
    func revealSearchResults(viewModel: DiscoverModels.SearchPrompt.ViewModel)
    func showError(viewModel: DiscoverModels.Error.ViewModel)
}

final class DiscoverViewController: BaseViewController {
    private var discoverTableView: DiscoverTableView = {
        let tv = DiscoverTableView(frame: .zero)
        return tv
    }()
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.accessibilityHint = #"""
            This search bar enables users to search for a particular book by prompt
        """#.localized
        search.title = "Search".localized
        search.automaticallyShowsCancelButton = true
        search.automaticallyShowsSearchResultsController = true
        return search
    }()
    
    var interactor: DiscoverBusinessLogic?
    var router: (any DiscoverRoutingLogic)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureNavigationController()
        setupUI()
        loadData()
    }
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupUI() {
        view.subviews(discoverTableView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        discoverTableView.Top == view.safeAreaLayoutGuide.Top
        discoverTableView.Bottom == view.Bottom
        discoverTableView.fillHorizontally()
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        title = "Discover".localized
    }
    
    private func loadData() {
        let request = DiscoverModels.InitData.Request()
        interactor?.viewDidLoad(request: request)
    }
}

extension DiscoverViewController: DiscoverDisplayLogic {
    func initialSetup(viewModel: DiscoverModels.InitData.ViewModel) {
        
    }
    
    func revealSearchResults(viewModel: DiscoverModels.SearchPrompt.ViewModel) {
        discoverTableView.configureWith(viewModel.books)
    }
    
    func showError(viewModel: DiscoverModels.Error.ViewModel) {
        print(viewModel.error.localizedDescription)
    }
}
