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
        containerView.addSubview(toView)
        containerView.addSubview(fromView)
        fromView.transform = CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.6, animations: {
            fromView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        }) { (finish) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete:@escaping (() -> ())) {
        containerView.addSubview(fromView)
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.6, animations: {
            toView.transform = CGAffineTransform.identity
        }) { (finish) in
            animationComplete()
        }
    }
}
