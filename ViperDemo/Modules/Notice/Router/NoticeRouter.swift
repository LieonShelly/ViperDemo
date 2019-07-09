//
//  NoticeRouter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/9.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter: PresenterToRouterNoticeProtocol {
    func createModoule() -> NoticeViewController {
        let view = NoticeViewController()
        let presenter = NoticePresenter()
        let interactor = NoticeInteractor()
        let router = NoticeRouter()
        /// view need presenter to handle
        view.presenter = presenter
        /// presenter need update view
        presenter.view = view
        /// presenter need interactor fetch data
        presenter.interactor = interactor
        /// interactor fetched data pass to presenter
        interactor.presenter = presenter
        /// presenter need router push or present
        presenter.router = router
        return view
    }
    
    func pushToMovieScreen(navigation: UINavigationController) {
        let movieVC = MoiveRouter.createMovieModule()
        navigation.pushViewController(movieVC, animated: true)
    }
}
