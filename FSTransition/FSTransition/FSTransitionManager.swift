//
//  FSTransitionManager.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

internal let kAnimationKey: UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: "kAnimationKey".hashValue)!
internal let kInteractiveKey: UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: "kInteractiveKey".hashValue)!

open class FSTransitionManager: NSObject, UIViewControllerTransitioningDelegate,UINavigationControllerDelegate{
    
    public private(set) var animation: FSTransitionAnimationProtocol
    
    private var operation: UINavigationController.Operation = .none
    
    public lazy var toTransitionAnimation: FSTransitionAnimation = {
        let animation = FSTransitionAnimation()
        animation.animationBlock = { [weak self] context in
            guard let fromView = context.view(forKey: .from) else{return}
            guard let toView = context.view(forKey: .to) else {return}//即将显示的视图
            let containerView = context.containerView
            guard let snapToView = toView.snapshotView(afterScreenUpdates: true) else { return }
            guard let snapFromView = fromView.snapshotView(afterScreenUpdates: true) else { return }
            self?.animation.snapFromView = snapFromView
            self?.animation.snapToView = snapToView
            self?.animation.setToAnimation(fromView, toView: toView, containerView: containerView, animationComplete: {
                snapToView.removeFromSuperview()
                snapFromView.removeFromSuperview()
                if context.transitionWasCancelled == true{
                    toView.removeFromSuperview()
                    containerView.addSubview(fromView)
                }else{
                    fromView.removeFromSuperview()
                    containerView.addSubview(toView)
                }
                context.completeTransition(!context.transitionWasCancelled)
            })
        }
        return animation
    }()
    
    public lazy var backTransitionAnimation: FSTransitionAnimation = {
        let animation = FSTransitionAnimation()
        animation.animationBlock = { [weak self] context in
            guard let fromView = context.view(forKey: .from) else{return}
            guard let toView = context.view(forKey: .to) else {return}//即将显示的视图
            let containerView = context.containerView
            guard let snapToView = toView.snapshotView(afterScreenUpdates: true) else { return }
            guard let snapFromView = fromView.snapshotView(afterScreenUpdates: true) else { return }
            self?.animation.snapFromView = snapFromView
            self?.animation.snapToView = snapToView
            self?.animation.backToAnimation(fromView, toView: toView, containerView: containerView, animationComplete: {
                snapToView.removeFromSuperview()
                snapFromView.removeFromSuperview()
                if context.transitionWasCancelled == true{
                    containerView.addSubview(fromView)
                }else{
                    containerView.addSubview(toView)
                }
                context.completeTransition(!context.transitionWasCancelled)
            })
        }
        return animation
    }()
    
    var toInteractiveTransition: FSInteractiveTransition?
    
    var backInteractiveTransition: FSInteractiveTransition?
    
    init(_ animation: FSTransitionAnimationProtocol) {
        self.animation = animation
    }
    
    // MARK: -- UIViewControllerTransitioningDelegate
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let transitionManager = objc_getAssociatedObject(presented, kAnimationKey) as? FSTransitionManager{
            return transitionManager.toTransitionAnimation
        }
        return nil
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let transitionManager = objc_getAssociatedObject(dismissed, kAnimationKey) as? FSTransitionManager{
            return transitionManager.backTransitionAnimation
        }
        return nil
    }
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let interactive = toInteractiveTransition{
            return interactive.isPanGestureIneration ? toInteractiveTransition : nil
        }
        return nil
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let interactive = backInteractiveTransition{
            return interactive.isPanGestureIneration ? backInteractiveTransition : nil
        }
        return nil
    }
    
    
    // MARK: -- UINavigationControllerDelegate
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.operation = operation
        switch operation {
        case .push:
            if let transitionManager = objc_getAssociatedObject(toVC, kAnimationKey) as? FSTransitionManager{
                return transitionManager.toTransitionAnimation
            }
        case .pop:
            if let transitionManager = objc_getAssociatedObject(fromVC, kAnimationKey) as? FSTransitionManager{
                return transitionManager.backTransitionAnimation
            }
        default:
            break
        }
        return nil
    }
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        switch operation {
        case .push:
            if let interactive = toInteractiveTransition{
                return interactive.isPanGestureIneration ? toInteractiveTransition : nil
            }
            return nil
        case .pop:
            return backInteractiveTransition
        default:
            break
        }
        return nil
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }
}
