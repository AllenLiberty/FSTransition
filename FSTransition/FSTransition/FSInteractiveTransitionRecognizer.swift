//
//  FSInteractiveTransitionRecognizer.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/22.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

public enum TransitionDirection {
    case left
    case right
    case top
    case bottom
    case leftOffset(CGFloat)
    case rightOffset(CGFloat)
    case topOffset(CGFloat)
    case bottomOffset(CGFloat)
}

open class InteractiveTransitionRecognizer: UIPanGestureRecognizer {
    private enum TransitionSwipeDirection {
        case toLeft
        case toRihgt
        case toTop
        case toBottom
    }
    
    override public init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        self.delegate = self
    }

    open var directions: [ TransitionDirection ] = [.left]
    open var offset: CGFloat = 0.0
    
    internal var direction: TransitionDirection = .left
    private func getSwipeDirection(_ recognizer: UIPanGestureRecognizer, view: UIView ) -> TransitionSwipeDirection {
        let position = recognizer.translation(in: view)
        let x = abs(Float(position.x))
        let y = abs(Float(position.y))
        if x > y {
            if position.x < 0 {
                return .toLeft
            }else{
                return .toRihgt
            }
        } else{
            if position.y < 0 {
                return .toTop
            }else{
                return .toBottom
            }
        }
    }
    
    // 判断响应的方向
    private func recognizerShouldBegin(_ direction: TransitionDirection, gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let view = self.view else { return false }
        let offSet: CGFloat = 40.0
        let point = location(in: view)
        guard point.x > 0, point.x < view.frame.width, point.y > 0, point.y < view.frame.height else { return false}
        
        switch direction {
        case .left:
            return (point.x < offSet) && getSwipeDirection(self, view: view) == .toRihgt
        case .top:
            return point.y < offSet && getSwipeDirection(self, view: view) == .toBottom
        case .right:
            return (view.frame.width - point.x) < offSet && getSwipeDirection(self, view: view) == .toLeft
        case .bottom:
            return (view.frame.height - point.y) < offSet && getSwipeDirection(self, view: view) == .toTop
        case .leftOffset(let leftOffset):
            return ((point.x > leftOffset) && (point.x < (view.frame.width - leftOffset + offSet))) && getSwipeDirection(self, view: view) == .toRihgt
        case .rightOffset(let rightOffset):
            return ((point.x < (view.frame.width - rightOffset)) && (point.x > (view.frame.width - rightOffset - offSet))) && getSwipeDirection(self, view: view) == .toLeft
        case .topOffset(let topOffset):
            return ((point.y > topOffset) && (point.y < topOffset + offSet)) && getSwipeDirection(self, view: view) == .toBottom
        case .bottomOffset(let bottomOffset):
            return ((point.y < (view.frame.width - bottomOffset)) && (point.y > (view.frame.width - bottomOffset - offSet))) && getSwipeDirection(self, view: view) == .toTop
        }
    }
}

extension InteractiveTransitionRecognizer: UIGestureRecognizerDelegate{
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        for direction in self.directions {
            if recognizerShouldBegin(direction, gestureRecognizer: gestureRecognizer) == true{
                self.direction = direction
                return true
            }
        }
        return false
    }
}
