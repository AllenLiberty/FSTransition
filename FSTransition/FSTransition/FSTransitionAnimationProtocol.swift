//
//  FSTransitionAnimationProtocol.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

public protocol FSTransitionAnimationProtocol {
    
    /// the snap view of the first controller. it's better to use this view on your animation
    var snapToView: UIView? {set get}
    
    /// the snap view of the second controller. it's better to use this view on your animation
    var snapFromView: UIView? {set get}
    
    /// set the animation when push or present Controller
    ///
    /// - Parameters:
    ///   - fromView: the orginal view of controller will be dismiss
    ///   - toView: the orginal view of first controller
    ///   - containerView: the orginal container view
    ///   - animationComplete: you need to perform this block when you are complete the animation.
    func setToAnimation(_ fromView: UIView, toView:UIView, containerView:UIView, animationComplete: @escaping (()->()))
    func backToAnimation(_ fromView: UIView, toView:UIView, containerView:UIView, animationComplete: @escaping (()->()))
}
