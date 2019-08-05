//
//  OpenDoorTranstionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/19.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit
import FSTransition

class OpenDoorTranstionAnimation: FSTransitionAnimationProtocol{
    var snapToView: UIView?
    
    var snapFromView: UIView?
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        fromView.frame = containerView.bounds
        var transform = CATransform3DIdentity
        transform.m34 = -0.001
        containerView.layer.sublayerTransform = transform
        
        snapFromView.layer.transform = CATransform3DIdentity
        snapFromView.layer.position = CGPoint(x:containerView.frame.width , y: 0)
        snapFromView.layer.anchorPoint = CGPoint(x: 1, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            snapFromView.layer.transform = CATransform3DMakeRotation(.pi/2, 0, 1, 0)
        }) { (finish) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapFromView)
        containerView.addSubview(snapToView)
        snapToView.frame = containerView.bounds
        var transform = CATransform3DIdentity
        transform.m34 = -0.001
        containerView.layer.sublayerTransform = transform
        
        snapToView.layer.transform = CATransform3DMakeRotation(.pi/2, 0, 1, 0)
        snapToView.layer.position = CGPoint(x:containerView.frame.width , y: 0)
        snapToView.layer.anchorPoint = CGPoint(x: 1, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            snapToView.layer.transform = CATransform3DIdentity
        }) { (finish) in
            animationComplete()
        }
    }
}
