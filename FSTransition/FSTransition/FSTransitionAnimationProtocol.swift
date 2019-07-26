//
//  FSTransitionAnimationProtocol.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

public protocol FSTransitionAnimationProtocol {
    var snapToView: UIView? {set get}
    var snapFromView: UIView? {set get}
    
    func setToAnimation(_ fromView: UIView, toView:UIView, containerView:UIView, animationComplete: @escaping (()->()))
    func backToAnimation(_ fromView: UIView, toView:UIView, containerView:UIView, animationComplete: @escaping (()->()))
}

extension FSTransitionAnimationProtocol{
    var snapToView: UIView {
        return UIView()
    }
}
