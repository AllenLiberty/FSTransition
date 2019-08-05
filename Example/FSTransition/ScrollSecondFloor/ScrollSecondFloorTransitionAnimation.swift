//
//  ScrollSecondFloorTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/31.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit
import FSTransition

class ScrollSecondFloorAnimation: FSTransitionAnimationProtocol {
    var snapToView: UIView?
    
    var snapFromView: UIView?
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapToView.frame = CGRect(x: 0, y: -snapToView.frame.height, width: snapToView.frame.width, height: snapToView.frame.height)
        UIView.animate(withDuration: 0.5, animations: {
            snapToView.frame = snapToView.bounds
            snapFromView.frame = CGRect(x: 0, y: snapFromView.frame.height, width: snapFromView.frame.width, height: snapFromView.frame.height)
        }) { (complete) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapToView.frame = CGRect(x: 0, y: snapToView.frame.height, width: snapToView.frame.width, height: snapToView.frame.height)
        UIView.animate(withDuration: 0.5, animations: {
            snapToView.frame = snapToView.bounds
            snapFromView.frame = CGRect(x: 0, y: -snapFromView.frame.height, width: snapFromView.frame.width, height: snapFromView.frame.height)
        }) { (complete) in
            animationComplete()
        }
    }
}
