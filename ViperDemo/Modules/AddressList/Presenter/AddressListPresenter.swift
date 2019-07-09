//
//  AddressListPresenter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/3.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

class AddressListPresenter {
    var interactor: AdressListViewInteractorInterface?
    var router: AddressListViewRouterInterface?
    var view: AddressListViewInterface?
    var addressViewModels: [AddressViewModel]?
}

extension AddressListPresenter: AddressListPresenterInterface {
    func getAddressViewModels() -> [AddressViewModel] {
        return addressViewModels ?? []
    }
    
    func notifyViewLoaded() {
        view?.setupInitialView()
        view?.showLoading()
        interactor?.fetchAdressList()
    }
    
    func notifyViewWillAppear() {
        view?.setScreenTitle(with: "Address List")
    }
    
    func addNewAddressTapped() {
        router?.performSegue(with: "")
    }
    
    func adressSelected() {
        router?.performSegue(with: "")
    }
    
    func addressListFetched(addressList: [Address]) {
        let addressViewModels: [AddressViewModel] = addressList.map { (title: $0.title, city: $0.city, address: $0.address)}
        self.addressViewModels = addressViewModels
        view?.hideLoading()
        view?.reloadData()
    }
    
    func addressFectchFailed(with errorMsg: String) {
        router?.persentPopup(with: errorMsg)
    }
}
