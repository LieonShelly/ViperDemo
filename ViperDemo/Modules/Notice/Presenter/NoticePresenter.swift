//
//  NoticePresenter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/9.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

class NoticePresenter: ViewToPresenterNoticeProtocol {
    var view: PresenterToViewNoticeProtocol?
    var router: PresenterToRouterNoticeProtocol?
    var interactor: PresenterToInteractorNoticeProtocol?
    
    func starFetchNotice() {
        interactor?.fetchNotice()
    }
    
    func showMoiveController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigation: navigationController)
    }
    
}

extension NoticePresenter: InteractorToPresennterNoticeProtocol {
    func noticeFetchFailed() {
        view?.showError()
    }
    
    func noticeFetchSuccess(noticeArray: Array<NoticeModel>) {
        view?.showNotice(noticeArray: noticeArray)
    }
}
