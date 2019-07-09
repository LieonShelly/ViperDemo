//
//  Protocol.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/3.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
// https://medium.com/trendyol-tech/creating-an-ios-viper-module-step-by-step-guide-cd1f414b7dd3
protocol AddressListViewInterface {
    func showLoading()
    func hideLoading()
    func reloadData()
    func setupInitialView()
    func setScreenTitle(with title: String)
}

protocol AddressListPresenterInterface {
    func notifyViewLoaded()
    func notifyViewWillAppear()
    func addNewAddressTapped()
    func adressSelected()
    func addressListFetched(addressList: [Address])
    func addressFectchFailed(with errorMsg: String)
    func getAddressViewModels() -> [AddressViewModel]
}

protocol AddressListViewRouterInterface {
    func popBack()
    func performSegue(with identifier: String)
    func persentPopup(with message: String)
}

protocol AdressListViewInteractorInterface {
    func fetchAdressList()
}

