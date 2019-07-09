//
//  AddressInterator.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/3.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

class AddressInterator {
    var presenter: AddressListPresenterInterface?
}

extension AddressInterator: AdressListViewInteractorInterface {
    func fetchAdressList() {
        let list = [Address("CD", city: "ChengdDU", address: "WUHOU"),
                    Address("CD", city: "CHENGDU", address: "QINGYANG"),
                    Address("CD", city: "CHENGDU", address: "GAOXIN")]
        presenter?.addressListFetched(addressList: list)
    }
}
