//
//  FSTransitionExtension.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /// push viewController with your custom animation
    ///
    /// - Parameters:
    ///   - viewController: the controller will be appear
    ///   - animation: custom animation
    func fs_pushViewController<T: FSTransitionAnimationProtocol>(_ viewController: UIViewController, animation:T) {
        guard let naviationController = self.navigationController else { return }
        let transitionManager = FSTransitionManager.init(animation)
        naviationController.delegate = transitionManager
        objc_setAssociatedObject(viewController, kAnimationKey, transitionManager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if let interactive = objc_getAssociatedObject(self, kInteractiveKey) as? FSInteractiveTransition {
            transitionManager.toInteractiveTransition = interactive
        }
        naviationController.pushViewController(viewController, animated: true)
    }
    
    func fs_presentViewController<T: FSTransitionAnimationProtocol>(_ viewController: UIViewController, animation:T) {
        let transitionManager = FSTransitionManager.init(animation)
        viewController.transitioningDelegate = transitionManager;
        objc_setAssociatedObject(viewController, kAnimationKey, transitionManager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if let interactive = objc_getAssociatedObject(self, kInteractiveKey) as? FSInteractiveTransition{
            transitionManager.toInteractiveTransition = interactive
        }
        self.present(viewController, animated: true, completion: nil)
    }
    
    /// - Parameters:
    ///   - derection: the derections to response the gesture
    ///   - view: the view to gesture the response if it's nil default the controller's view
    ///   - progress: 0~1 defalut is 0.5. when the progress is more than this, the next controller will be appear.
    ///   - block: called when recieve the gesture
    func fs_registerToInteractiveTransition(_ derection: [TransitionDirection], view: UIView? = nil,responseOffset: CGFloat? = 40.0, progress: Float? = 0.5, block:@escaping (() -> ())) {
        let interactive = FSInteractiveTransition()
        interactive.eventBlock = block
        interactive.offset = responseOffset
        interactive.progress = progress ?? 0.5
        interactive.addEdgePageGesture(view ?? self.view, direction: derection)
        objc_setAssociatedObject(self, kInteractiveKey, interactive, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
    }
    
    /// - Parameters:
    ///   - derection: the derections to response the gesture
    ///   - progress: 0~1 defalut is 0.5. when the progress is more than this, the next controller will be appear.
    ///   - block: called when recieve the gesture
    func fs_registerBackInteractiveTransition(_ derection: [TransitionDirection], view: UIView? = nil,responseOffset: CGFloat? = 40.0, progress: Float? = 0.5, block:@escaping (()->())){
        let interactive = FSInteractiveTransition()
        interactive.eventBlock = block
        interactive.offset = responseOffset
        interactive.progress = progress ?? 0.5
        interactive.addEdgePageGesture(view ?? self.view, direction: derection)
        if let transitionManager = objc_getAssociatedObject(self, kAnimationKey) as? FSTransitionManager{
            transitionManager.backInteractiveTransition = interactive
        }
    }
    
    func fs_resignInteractiveTransition() {
        if let interactive = objc_getAssociatedObject(self, kInteractiveKey) as? FSInteractiveTransition{
            interactive.removeEdgePageGesture()
        }
    }
}
