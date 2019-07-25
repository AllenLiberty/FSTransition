//
//  OpenMiddleTranstionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/22.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class OpenMiddleTranstionAnimation: FSTransitionAnimationProtocol {
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        let leftFrame = CGRect(x: 0, y: 0, width: fromView.frame.width / 2.0, height: fromView.frame.height)
        let rightFrame = CGRect(x: leftFrame.width, y: 0, width: fromView.frame.width / 2.0, height: fromView.frame.height)
        guard let rightView = fromView.resizableSnapshotView(from: rightFrame, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        guard let leftView = fromView.resizableSnapshotView(from: leftFrame, afterScreenUpdates: true, withCapInsets: .zero) else { return }

        
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .black
        
        containerView.addSubview(bgView)
        containerView.addSubview(toView)
        containerView.addSubview(leftView)
        containerView.addSubview(rightView)
        leftView.frame = leftFrame
        rightView.frame = rightFrame
        
        toView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0)
        UIView.animate(withDuration: 0.5, animations: {
            toView.layer.transform = CATransform3DIdentity
            leftView.frame = CGRect(x: -leftView.frame.width, y: 0, width: leftView.frame.width, height: leftView.frame.height)
            rightView.frame = CGRect(x: containerView.frame.width, y: 0, width: rightView.frame.width, height: rightView.frame.height)
        }) { (complete) in
            bgView.removeFromSuperview()
            leftView.removeFromSuperview()
            rightView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        containerView.addSubview(toView)
        let leftFrame = CGRect(x: 0, y: 0, width: fromView.frame.width / 2.0, height: toView.frame.height)
        let rightFrame = CGRect(x: leftFrame.width, y: 0, width: fromView.frame.width / 2.0, height: toView.frame.height)
        guard let rightView = toView.resizableSnapshotView(from: rightFrame, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        guard let leftView = toView.resizableSnapshotView(from: leftFrame, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        
        
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .black
        
        containerView.addSubview(bgView)
        containerView.addSubview(fromView)
        containerView.addSubview(leftView)
        containerView.addSubview(rightView)
        
        fromView.layer.transform = CATransform3DIdentity
        leftView.frame = CGRect(x: -leftView.frame.width, y: 0, width: leftView.frame.width, height: leftView.frame.height)
        rightView.frame = CGRect(x: containerView.frame.width, y: 0, width: rightView.frame.width, height: rightView.frame.height)
        
        UIView.animate(withDuration: 0.5, animations: {
            fromView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0)
            leftView.frame = leftFrame
            rightView.frame = rightFrame
        }) { (complete) in
            bgView.removeFromSuperview()
            leftView.removeFromSuperview()
            rightView.removeFromSuperview()
            animationComplete()
        }
    }
}
