//
//  MoivePresenter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/8.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

class MoivePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewMovieProtocol?
    var interactor: PresenterToInteractorMovieProtocol?
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchMoive() {
        interactor?.fetchMovie()
    }
}

extension MoivePresenter: InteractorToPresenterMovieProtocol {
    func movieFetchSuccess(movieList: Array<Any>) {
        view?.onMovieResponseSuccess(moviceModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from apu response")
    }
}
