//
//  ScaleTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit
import FSTransition

class ScaleTransitionAnimation: FSTransitionAnimationProtocol {
    
    var snapToView: UIView?
    
    var snapFromView: UIView?
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapFromView.layer.transform = CATransform3DIdentity
        
        UIView.animate(withDuration: 0.6, animations: {
            snapFromView.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        }) { (finish) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapFromView)
        containerView.addSubview(snapToView)
        snapToView.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.6, animations: {
            snapToView.layer.transform = CATransform3DIdentity
        }) { (finish) in
            animationComplete()
        }
    }
}
