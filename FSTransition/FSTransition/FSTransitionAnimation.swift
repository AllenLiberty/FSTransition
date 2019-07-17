//
//  FSTransitionAnimation.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import Foundation
import UIKit

open class FSTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var animationBlock:((_ context: UIViewControllerContextTransitioning) -> Void)?
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.animationBlock?(transitionContext)
    }
}
