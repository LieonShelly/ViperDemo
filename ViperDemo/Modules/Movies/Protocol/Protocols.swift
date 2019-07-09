//
//  Protocols.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/6.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol {
    var view: PresenterToViewMovieProtocol? { get set}
    var interactor: PresenterToInteractorMovieProtocol? { get set }
    var router: PresenterToRouterMovieProtocol? { get set }
    func startFetchMoive()
}

protocol PresenterToViewMovieProtocol {
    func onMovieResponseSuccess(moviceModelArrayList: [Any])
    func onMovieResponseFailed(error: String)
}


protocol PresenterToRouterMovieProtocol {
    static func createMovieModule() -> MovieViewController
}

protocol PresenterToInteractorMovieProtocol {
    func fetchMovie()
    var presenter:InteractorToPresenterMovieProtocol? {get set }
}

protocol InteractorToPresenterMovieProtocol {
    func movieFetchSuccess(movieList: Array<Any>)
    func movieFetchFailed()
}
