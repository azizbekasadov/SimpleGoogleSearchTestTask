//
//  DiscoverInteractor.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import Foundation

protocol DiscoverBusinessLogic: AnyObject {
    func viewDidLoad(request: DiscoverModels.InitData.Request)
    func didEnterSearchPrompt(request: DiscoverModels.SearchPrompt.Request)
    func didReceiveError(request: DiscoverModels.Error.Request)
}

final class DiscoverInteractor {
    private var worker: DiscoverWorkerProtocol
    
    var presenter: DiscoverPresentationProtocol?
    
    init(worker: DiscoverWorkerProtocol) {
        self.worker = worker
    }
}

extension DiscoverInteractor: DiscoverBusinessLogic {
    func viewDidLoad(request: DiscoverModels.InitData.Request) {
        let response = DiscoverModels.InitData.Response()
        presenter?.displayData(response: response)
    }
    
    func didEnterSearchPrompt(request: DiscoverModels.SearchPrompt.Request) {
        worker.searchBook(by: request.searchPrompt) { result in
            switch result {
            case .success(let entities):
                let response = DiscoverModels.SearchPrompt.Response(books: entities)
                OperationQueue.main.addOperation { [weak self] in
                    self?.presenter?.displaySearchResults(response: response)
                }
            case .failure(let error):
                let response = DiscoverModels.Error.Response(error: error as! LocalizedError)
                OperationQueue.main.addOperation { [weak self] in
                    self?.presenter?.displayError(response: response)
                }
            }
        }
    }
    
    func didReceiveError(request: DiscoverModels.Error.Request) {
        let response = DiscoverModels.Error.Response(error: request.error)
        presenter?.displayError(response: response)
    }
}
