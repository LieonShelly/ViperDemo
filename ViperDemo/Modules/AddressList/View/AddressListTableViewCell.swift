//
//  AddressListTableViewCell.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/5.
//  Copyright © 2019 lieon. All rights reserved.
//

import UIKit

class AddressListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func connfig(_ addressVM: AddressViewModel) {
        titleLabel.text = addressVM.title
        subTitleLabel.text = addressVM.city
        thirdLabel.text = addressVM.address
    }
}
