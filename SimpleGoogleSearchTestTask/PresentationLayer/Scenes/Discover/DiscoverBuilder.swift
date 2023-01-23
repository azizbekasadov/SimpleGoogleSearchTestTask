//
//  DiscoverBuilder.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

struct DiscoverBuilder {
    static func build() -> DiscoverViewController {
        let moduleViewController = DiscoverViewController()
        loadScene(viewController: moduleViewController)
        return moduleViewController
    }
}

extension DiscoverBuilder {
    private static func loadScene(viewController: DiscoverViewController) {
        let libraryTask = BookSearchTask()
        let worker = DiscoverWorker(libraryTask: libraryTask)
        let interactor = DiscoverInteractor(worker: worker)
        let presenter = DiscoverPresenter()
        let router = DiscoverRouter()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
