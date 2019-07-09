//
//  MoiveInteractor.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/8.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation

class MoiveInteractor: PresenterToInteractorMovieProtocol {
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie() {
        /// request api
        URLSession.shared.dataTask(with: URL(string: "https://api.myjson.com/bins/1h87n6")!) { (data, _, error) in
            if let data = data,  let _ =  try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any]{
                /// unwrap json to model
                if error != nil {
                    self.presenter?.movieFetchFailed()
                } else {
                    self.presenter?.movieFetchSuccess(movieList: [])
                }
            }
          
        }
    }
}
