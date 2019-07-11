//
//  ListRouter.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/11.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

struct ListEntryEntity {
    let language: String
}

struct ListRouterInput {
    
    func push(form fromView: Viewable, entryEntity: ListEntryEntity) {
        let view = self.view(entryEntity: entryEntity)
        fromView.push(view, animated: true)
    }
    
    private func view(entryEntity: ListEntryEntity) -> ListViewController {
        let view = ListViewController()
        let interactor = ListInteractor()
        let dependencies = ListPresenterDependenies(interactor: interactor, router: ListRouterOutput(view))
        let presenter = ListPresenter(entryEntity: entryEntity, dependencies: dependencies)
        view.presenter = presenter
        return view
    }
    
    func presente(from: Viewable, entryEntity: ListEntryEntity) {
        let nav = UINavigationController(rootViewController: view(entryEntity: entryEntity))
        from.present(nav, animated: true)
    }
}

final class ListRouterOutput: Routerable {
    private(set) weak var view: Viewable!
    
    init(_ view: Viewable) {
        self.view = view
    }
    
}
