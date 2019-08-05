//
//  CollectionTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/26.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit
import FSTransition

class CollectionTransitionAnimation:  FSTransitionAnimationProtocol{
    
    let rect: CGRect
    let snapCell: UIView
    
    init(_ rect: CGRect, snapCell: UIView) {
        self.rect = rect
        self.snapCell = snapCell
    }
    
    var snapToView: UIView?
    
    var snapFromView: UIView?
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        guard let snapFromView = snapFromView else { return }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        containerView.addSubview(snapCell)
        snapCell.frame = rect
        let scale = containerView.frame.width / snapCell.frame.width
        let scaleFram = CGRect(x: 0 * scale, y: 0, width: rect.width * scale, height: rect.height * scale)
        
        UIView.animate(withDuration:0.5, animations: {
            self.snapCell.frame = scaleFram
            snapFromView.alpha = 0.1
        }) { (complete) in
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = snapToView else { return }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapCell)
        UIView.animate(withDuration:0.5, animations: {
            self.snapCell.frame = self.rect
        }) { (complete) in
            animationComplete()
        }
    }
}
