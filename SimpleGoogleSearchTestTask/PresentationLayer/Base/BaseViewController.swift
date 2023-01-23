//
//  BaseViewController.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit

public class BaseViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        bindNotifications()
    }
    
    private func configureViews() {
        view.backgroundColor = UIColor.systemBackground
    }
    
    private func bindNotifications() {
        NotificationCenter.default.addObserver(forName: .didChangeLanguage, object: nil, queue: .main) { [weak self] _ in
            guard let _self = self else { return }
            _self.view.localize()
            _self.navigationItem.localize()
            _self.didChangeLanguage()
        }
        
        NotificationCenter.default.addObserver(forName: .didClearCache, object: nil, queue: .main) { [weak self] _ in
            self?.didClearCache()
        }
        NotificationCenter.default.addObserver(forName: .didChangeColor, object: nil, queue: .main) { [weak self] _ in
            guard let _self = self else { return }
            _self.view.colorize()
            _self.navigationController?.navigationBar.colorize()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension BaseViewController {
    @objc internal func didChangeLanguage() { /* Override it if needed */ }
    
    @objc internal func didClearCache() { /* Override it if needed */ }
}
