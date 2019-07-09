//
//  MoiveRouter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/9.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

class MoiveRouter: PresenterToRouterMovieProtocol {
    
    static func createMovieModule() -> MovieViewController {
        let view = MovieViewController()
        var presenter: ViewToPresenterProtocol & InteractorToPresenterMovieProtocol = MoivePresenter()
        var interactor: PresenterToInteractorMovieProtocol = MoiveInteractor()
        let router: PresenterToRouterMovieProtocol = MoiveRouter()
        
        view.moivePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
