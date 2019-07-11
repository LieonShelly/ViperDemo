//
//  ListInteractor.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/11.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Action

final class ListInteractor {
    /// input
    let searchActionTrigger = PublishRelay<String>.init()
    
    /// output
    private let searchAction: Action<String, String>
    let serchResponse: Observable<String>
    let searchIsLoading: Observable<Bool>
    let searchError: Observable<NSError>
    private let bag = DisposeBag()
    
    init() {
        searchAction = Action { str in
            return Observable.just(str)
        }
        let _searchResponse = PublishRelay<String>()
        self.serchResponse = _searchResponse.asObservable()
        self.searchIsLoading = searchAction.executing.startWith(false)
        self.searchError = searchAction.errors.map { _ in NSError(domain: "Netwok Error", code: -11, userInfo: nil)}
        searchAction.elements.asObservable()
            .bind(to: _searchResponse)
            .disposed(by: bag)
        searchActionTrigger.asObservable()
            .bind(to: searchAction.inputs)
            .disposed(by: bag)
    }
    
}
