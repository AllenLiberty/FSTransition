//
//  OpenDoorTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/17.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class SliderTransitionAnimation: FSTransitionAnimationProtocol {
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .black
        containerView.addSubview(bgView)
        containerView.addSubview(toView)
        containerView.addSubview(fromView)
        
        fromView.layer.transform = CATransform3DIdentity
        let transformTranslation = CATransform3DMakeTranslation(containerView.frame.width, 0, 0)
        toView.layer.transform = CATransform3DScale(transformTranslation, 0.7, 0.7, 1)
        UIView.animate(withDuration: 0.6, animations: {
            let transformTranslation = CATransform3DMakeTranslation(-fromView.frame.width, 0, 0)
            fromView.layer.transform = CATransform3DScale(transformTranslation, 0.7, 0.7, 1)
            toView.layer.transform = CATransform3DIdentity
        }) { (complete) in
            bgView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .black
        containerView.addSubview(bgView)
        containerView.addSubview(toView)
        containerView.addSubview(fromView)
        fromView.layer.transform = CATransform3DIdentity
        let transformTranslation = CATransform3DMakeTranslation(-fromView.frame.width, 0, 0)
        toView.layer.transform = CATransform3DScale(transformTranslation, 0.7, 0.7, 1)
        UIView.animate(withDuration: 0.6, animations: {
            let transformTranslation = CATransform3DMakeTranslation(fromView.frame.width, 0, 0)
            fromView.layer.transform = CATransform3DScale(transformTranslation, 0.7, 0.7, 1)
            toView.layer.transform = CATransform3DIdentity
        }) { (complete) in
            bgView.removeFromSuperview()
            animationComplete()
        }
    }
}
