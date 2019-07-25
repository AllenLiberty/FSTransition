//
//  SecondFloorTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class SecondFloorTransitionAnimation: FSTransitionAnimationProtocol {
    
    let topOffset: CGFloat
    
    init(topOffset: CGFloat) {
        self.topOffset = topOffset
    }
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        let topFrame = CGRect(x: 0, y: 0, width: fromView.frame.width, height: topOffset)
        let bottomFrame = CGRect(x: 0, y: topOffset, width: fromView.frame.width, height: fromView.frame.height - topOffset)
        guard let topView = fromView.resizableSnapshotView(from: topFrame, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        guard let bottomView = fromView.resizableSnapshotView(from: bottomFrame, afterScreenUpdates: true, withCapInsets: .zero) else { return }
        
        containerView.addSubview(toView)
        containerView.addSubview(topView)
        containerView.addSubview(bottomView)
        
        toView.frame = CGRect(x: 0, y: -(toView.frame.height - topOffset), width: toView.frame.width, height: toView.frame.height)
        topView.frame = topFrame
        bottomView.frame = bottomFrame
        
        UIView.animate(withDuration: 0.5, animations: {
            topView.frame = CGRect(x: 0, y: -self.topOffset, width: topView.frame.width, height: topView.frame.height)
            bottomView.frame = CGRect(x: 0, y: containerView.frame.height, width: bottomFrame.width, height: bottomFrame.height)
            toView.frame = containerView.bounds
        }) { (complete) in
            topView.removeFromSuperview()
            bottomView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        
    }
}
