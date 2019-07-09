//
//  NoticeProtocol.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/9.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterNoticeProtocol {
    var view: PresenterToViewNoticeProtocol? { get set }
    var router: PresenterToRouterNoticeProtocol? { get set }
    var interactor: PresenterToInteractorNoticeProtocol? { get set}
    func starFetchNotice()
    func showMoiveController(navigationController: UINavigationController)
}

protocol PresenterToViewNoticeProtocol {
    func showNotice(noticeArray: Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterNoticeProtocol {
    func createModoule() -> NoticeViewController
    func pushToMovieScreen(navigation: UINavigationController)
}

protocol PresenterToInteractorNoticeProtocol {
    func fetchNotice()
    /// interactor通知presenter
    var presenter: InteractorToPresennterNoticeProtocol? {get set}
}


protocol InteractorToPresennterNoticeProtocol {
    func noticeFetchSuccess(noticeArray: Array<NoticeModel>)
    func noticeFetchFailed()
}
