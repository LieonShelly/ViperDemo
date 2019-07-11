//
//  ListPresenter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/11.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Action

struct GitHubRepository {
    
}

typealias ListPresenterDependenies = (interactor: ListInteractor, router: ListRouterOutput)

protocol ListPrenterInputs {
    var viewDidLoadTrigger: PublishSubject<Void> {get}
    var coseBtnTapTriiger: PublishSubject<Void> {get}
    var reachedBtnTrigger: PublishSubject<Void> {get}
    var didSelectRowTrigger: PublishSubject<IndexPath> {get}
}

protocol ListPresenterOutputs {
    var githubRepositories: BehaviorRelay<[String]> { get }
    var viewConfigre: Observable<ListEntryEntity> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<NSError> { get }
}

protocol ListerPresnterInterface {
    var inputs: ListPrenterInputs { get }
    var outputs: ListPresenterOutputs { get }
}

class ListPresenter: ListerPresnterInterface, ListPresenterOutputs, ListPrenterInputs {
    var inputs: ListPrenterInputs { return self }
    var outputs: ListPresenterOutputs { return self }
    var viewDidLoadTrigger: PublishSubject<Void> = .init()
    var coseBtnTapTriiger: PublishSubject<Void> = .init()
    var reachedBtnTrigger: PublishSubject<Void> = .init()
    var didSelectRowTrigger: PublishSubject<IndexPath> = .init()
    var githubRepositories: BehaviorRelay<[String]> = .init(value: [])
    var viewConfigre: Observable<ListEntryEntity>
    var isLoading: Observable<Bool>
    var error: Observable<NSError>
    
    private var dependencies: ListPresenterDependenies
    let bag = DisposeBag()
    
    init(entryEntity: ListEntryEntity, dependencies: ListPresenterDependenies) {
        self.dependencies = dependencies
        self.error = dependencies.interactor.searchError
        self.isLoading = dependencies.interactor.searchIsLoading
        let _viewConfigure = PublishRelay<ListEntryEntity>()
        self.viewConfigre = _viewConfigure.asObservable().take(1)
        
        viewDidLoadTrigger.asObservable()
            .withLatestFrom(Observable.just(entryEntity))
            .bind(to: _viewConfigure)
            .disposed(by: bag)
        
        coseBtnTapTriiger.asDriver(onErrorJustReturn: ())
            .drive(onNext: {[weak self] (_) in
                self?.dependencies.router.dismiss(animated: true, _completion: nil)
            })
            .disposed(by: bag)

        didSelectRowTrigger.asObservable()
            .observeOn(MainScheduler.asyncInstance)
            .bind(onNext: transitionDetail(indexPath:))
            .disposed(by: bag)
        
        dependencies.interactor.serchResponse
            .map { $0}
            .withLatestFrom(githubRepositories, resultSelector: {($1, $0)})
            .map { $0.0 + [$0.1]}
            .subscribe(onNext: { [weak self](reponses) in
                self?.githubRepositories.accept(reponses)
            })
            .disposed(by: bag)

    }
    
    private func transitionDetail(indexPath: IndexPath) {
        /// push
    }

    
}

