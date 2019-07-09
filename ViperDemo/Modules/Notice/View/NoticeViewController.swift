//
//  NoticeViewController.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/9.
//  Copyright © 2019 lieon. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {
    var presenter: ViewToPresenterNoticeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.starFetchNotice()
    }
}

extension NoticeViewController: PresenterToViewNoticeProtocol {
    func showError() {
        
    }
    
    func showNotice(noticeArray: Array<NoticeModel>) {
        /// reload UI
    }
}
