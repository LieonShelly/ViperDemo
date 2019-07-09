//
//  AddressListRouter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/3.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

class AddressListRouter {
    var navigationController: UINavigationController?
    var presenter: AddressListPresenterInterface?
    
    static func createModule(using navigationController: UINavigationController) -> AddressListViewController {
        let router = AddressListRouter()
        let presenter = AddressListPresenter()
        let interactor = AddressInterator()
        let view = AddressListViewController()
        
        /// connet layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.navigationController = navigationController
        return view
    }
}

extension AddressListRouter: AddressListViewRouterInterface {
    func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func performSegue(with identifier: String) {
        navigationController?.visibleViewController?.performSegue(withIdentifier: identifier, sender: nil)
    }
    
    func persentPopup(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Allright", style: .default, handler: nil))
        self.navigationController?.visibleViewController?.present(alertController, animated: true, completion: nil)
    }
}



