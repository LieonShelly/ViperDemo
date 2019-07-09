//
//  AddressListEntity.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/3.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

struct Address {
    var title: String
    var city: String
    var address: String
    
    init(_ title: String, city: String, address: String) {
        self.title = title
        self.city = city
        self.address = address
    }
}


typealias AddressViewModel = (title: String, city: String, address: String)
