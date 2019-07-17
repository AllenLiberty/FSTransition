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
        guard let snapFromView = fromView.snapshotView(afterScreenUpdates: true) else { return }
        guard let snapToView = toView.snapshotView(afterScreenUpdates: true) else { return }
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .black
        containerView.addSubview(bgView)
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        
        snapFromView.layer.transform = CATransform3DIdentity
        let transformTranslation = CATransform3DMakeTranslation(containerView.frame.width, 0, 0)
        snapToView.layer.transform = CATransform3DScale(transformTranslation, 0.8, 0.8, 1)
        UIView.animate(withDuration: 0.6, animations: {
            let transformTranslation = CATransform3DMakeTranslation(-snapFromView.frame.width, 0, 0)
            snapFromView.layer.transform = CATransform3DScale(transformTranslation, 0.8, 0.8, 1)
            snapToView.layer.transform = CATransform3DIdentity
        }) { (complete) in
            bgView.removeFromSuperview()
            snapFromView.removeFromSuperview()
            snapToView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        guard let snapFromView = fromView.snapshotView(afterScreenUpdates: true) else { return }
        guard let snapToView = toView.snapshotView(afterScreenUpdates: true) else { return }
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .black
        containerView.addSubview(bgView)
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapFromView.layer.transform = CATransform3DIdentity
        let transformTranslation = CATransform3DMakeTranslation(-snapFromView.frame.width, 0, 0)
        snapToView.layer.transform = CATransform3DScale(transformTranslation, 0.8, 0.8, 1)
        UIView.animate(withDuration: 0.6, animations: {
            let transformTranslation = CATransform3DMakeTranslation(snapFromView.frame.width, 0, 0)
            snapFromView.layer.transform = CATransform3DScale(transformTranslation, 0.8, 0.8, 1)
            snapToView.layer.transform = CATransform3DIdentity
        }) { (complete) in
            bgView.removeFromSuperview()
            snapFromView.removeFromSuperview()
            snapToView.removeFromSuperview()
            animationComplete()
        }
    }
}
