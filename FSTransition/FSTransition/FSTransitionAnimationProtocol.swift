//
//  FSTransitionAnimationProtocol.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

public protocol FSTransitionAnimationProtocol {
    func setToAnimation(_ fromView: UIView, toView:UIView, containerView:UIView, animationComplete: @escaping (()->()))
    func backToAnimation(_ fromView: UIView, toView:UIView, containerView:UIView, animationComplete: @escaping (()->()))
}