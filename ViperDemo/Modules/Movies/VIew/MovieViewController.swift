//
//  MovieViewController.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/6.
//  Copyright © 2019 lieon. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    var moivePresenter: ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moivePresenter?.startFetchMoive()
    }



}

extension MovieViewController: PresenterToViewMovieProtocol {
    func onMovieResponseSuccess(moviceModelArrayList: [Any]) {
        /// GET Data, reload UI
    }
    
    func onMovieResponseFailed(error: String) {
        /// error message
    }
}

//
