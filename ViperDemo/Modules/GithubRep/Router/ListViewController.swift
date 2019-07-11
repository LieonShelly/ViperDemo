//
//  ListViewController.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/11.
//  Copyright © 2019 lieon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ListViewController: UIViewController, Viewable {
    var presenter: ListerPresnterInterface!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeBtn: UIButton!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.rx.tap.asDriver()
            .drive(presenter.inputs.coseBtnTapTriiger)
            .disposed(by: bag)
        
        presenter.outputs.viewConfigre
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self](entryEntity) in
                self?.title = entryEntity.language
            })
            .disposed(by: bag)
        
        presenter.outputs.githubRepositories
            .asObservable()
            .filter { !$0.isEmpty }
            .subscribe(onNext: {[weak self] (_) in
                self?.tableView.reloadData()
            })
            .disposed(by: bag)
        
        presenter.outputs.isLoading
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: activity.rx.isAnimating)
            .disposed(by: bag)
        
        presenter.inputs.viewDidLoadTrigger.onNext(())
        presenter.inputs.viewDidLoadTrigger.onNext(())
        
    }

}
