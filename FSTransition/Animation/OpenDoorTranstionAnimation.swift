//
//  OpenDoorTranstionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/19.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class OpenDoorTranstionAnimation: FSTransitionAnimationProtocol{
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapFromeView = fromView.snapshotView(afterScreenUpdates: true)else {return}
        containerView.addSubview(toView)
        containerView.addSubview(snapFromeView)
        snapFromeView.frame = containerView.bounds
        var transform = CATransform3DIdentity
        transform.m34 = -0.001
        containerView.layer.sublayerTransform = transform
        
        snapFromeView.layer.transform = CATransform3DIdentity
        snapFromeView.layer.position = CGPoint(x: 0, y: 0)
        snapFromeView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            snapFromeView.layer.transform = CATransform3DMakeRotation(-.pi/2, 0, 1, 0)
        }) { (finish) in
            snapFromeView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapFromeView = toView.snapshotView(afterScreenUpdates: true)else {return}
        containerView.addSubview(snapFromeView)
        snapFromeView.frame = containerView.bounds
        var transform = CATransform3DIdentity
        transform.m34 = -0.001
        containerView.layer.sublayerTransform = transform
        
        
        snapFromeView.layer.transform = CATransform3DMakeRotation(-.pi/2, 0, 1, 0)
        snapFromeView.layer.position = CGPoint(x: 0, y: 0)
        snapFromeView.layer.anchorPoint = CGPoint(x: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            snapFromeView.layer.transform = CATransform3DIdentity
        }) { (finish) in
            snapFromeView.removeFromSuperview()
            animationComplete()
        }
    }
}
