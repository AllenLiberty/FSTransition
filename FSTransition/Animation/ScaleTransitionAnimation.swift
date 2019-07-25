//
//  ScaleTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ScaleTransitionAnimation: FSTransitionAnimationProtocol {
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapFromView = fromView.resizableSnapshotView(from: fromView.bounds, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        containerView.addSubview(toView)
        containerView.addSubview(snapFromView)
        snapFromView.transform = CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.6, animations: {
            snapFromView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        }) { (finish) in
            snapFromView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapToView = toView.resizableSnapshotView(from: toView.bounds, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        containerView.addSubview(fromView)
        containerView.addSubview(snapToView)
        snapToView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.6, animations: {
            snapToView.transform = CGAffineTransform.identity
        }) { (finish) in
            snapToView.removeFromSuperview()
            animationComplete()
        }
    }
}
