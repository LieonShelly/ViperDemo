//
//  ViewGithubProtocol.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/10.
//  Copyright © 2019 lieon. All rights reserved.
//

import Foundation
import UIKit

protocol Viewable: AnyObject {
    func push(_ vc: UIViewController, animated: Bool)
    func present(_ vc: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func dismiss(animated: Bool, _completion: (() -> Void)?)
}

extension Viewable where Self: UIViewController {
    func push(_ vc: UIViewController, animated: Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func present(_ vc: UIViewController, animated: Bool) {
        present(vc, animated: animated)
    }
    
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool, _completion: (() -> Void)?) {
        dismiss(animated: animated, completion: _completion)
    }
}

protocol Routerable {
    var view: Viewable! { get }
    func pop(animated: Bool)
    func dismiss(animated: Bool, _completion: (() -> Void)?)
}

extension Routerable {
    func pop(animated: Bool) {
        view.pop(animated: animated)
    }
    
    func dismiss(animated: Bool, _completion: (() -> Void)?) {
        view.dismiss(animated: animated, _completion: _completion)
    }
}


protocol Presenterable {
    
}

protocol Interactorable {
    
}
