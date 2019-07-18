//
//  FSTransitionExtension.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

extension UIViewController {
    func fs_pushViewController<T: FSTransitionAnimationProtocol>(_ viewController:UIViewController, animation:T) {
        guard let naviationController = self.navigationController else { return }
        let transitionManager = FSTransitionManager.init(animation)
        naviationController.delegate = transitionManager
        objc_setAssociatedObject(viewController, kAnimationKey, transitionManager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if let interactive = objc_getAssociatedObject(self, kInteractiveKey) as? FSInteractiveTransition {
            transitionManager.toInteractiveTransition = interactive
        }
        naviationController.pushViewController(viewController, animated: true)
    }
    
    func fs_presentViewController<T: FSTransitionAnimationProtocol>(_ viewController:UIViewController, animation:T) {
        let transitionManager = FSTransitionManager.init(animation)
        viewController.transitioningDelegate = transitionManager;
        objc_setAssociatedObject(viewController, kAnimationKey, transitionManager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if let interactive = objc_getAssociatedObject(self, kInteractiveKey) as? FSInteractiveTransition{
            transitionManager.toInteractiveTransition = interactive
        }
        self.present(viewController, animated: true, completion: nil)
    }
    
    func fs_registerToInteractiveTransition(_ derection: UIRectEdge, block:@escaping (() -> ())) {
        let interactive = FSInteractiveTransition()
        interactive.eventBlock = block
        interactive.addEdgePageGesture(self.view, direction: derection)
        objc_setAssociatedObject(self, kInteractiveKey, interactive, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
    }
    func fs_registerBackInteractiveTransition(_ derection: UIRectEdge, block:@escaping (()->())){
        let interactive = FSInteractiveTransition()
        interactive.eventBlock = block
        interactive.addEdgePageGesture(self.view, direction: derection)
        if let transitionManager = objc_getAssociatedObject(self, kAnimationKey) as? FSTransitionManager{
            transitionManager.backInteractiveTransition = interactive
        }
    }
}
