//
//  NoticeInteractor.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/9.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

class NoticeInteractor: PresenterToInteractorNoticeProtocol {
    var presenter: InteractorToPresennterNoticeProtocol?
    
    func fetchNotice() {
        URLSession.shared.dataTask(with: URL(string: "https://api.myjson.com/bins/1bsqcn/")!) { (data, _, error) in
            if error != nil {
                self.presenter?.noticeFetchFailed()
            } else {
                self.presenter?.noticeFetchSuccess(noticeArray: Array<NoticeModel>([NoticeModel(), NoticeModel()]))
            }
        }
    }
    
    
    
}
