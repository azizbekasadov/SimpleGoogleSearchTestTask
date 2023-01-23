//
//  DiscoverPresenter.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

protocol DiscoverPresentationProtocol: AnyObject {
    func displayData(response: DiscoverModels.InitData.Response)
    func displaySearchResults(response: DiscoverModels.SearchPrompt.Response)
    func displayError(response: DiscoverModels.Error.Response)
}

final class DiscoverPresenter {
    weak var viewController: DiscoverDisplayLogic?
}

extension DiscoverPresenter: DiscoverPresentationProtocol {
    func displayData(response: DiscoverModels.InitData.Response) {
        let viewModel = DiscoverModels.InitData.ViewModel()
        viewController?.initialSetup(viewModel: viewModel)
    }

    func displaySearchResults(response: DiscoverModels.SearchPrompt.Response) {
        let viewModel = DiscoverModels.SearchPrompt.ViewModel()
        viewController?.revealSearchResults(viewModel: viewModel)
    }
    
    func displayError(response: DiscoverModels.Error.Response) {
        let viewModel = DiscoverModels.Error.ViewModel(error: response.error)
        viewController?.showError(viewModel: viewModel)
    }
}
