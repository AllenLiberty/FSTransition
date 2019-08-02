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
    
    /// make the array of directions of gesture
    open var directions: [ TransitionDirection ] = [.left]
    
    /// make the response area  eg. when deiection content left or right the response area with == offSet. if deiection content top or bottom the response area height == offSet
    open var offSet: CGFloat = 40.0
    
    override public init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        self.delegate = self
    }
    
    // MARK: -- private method
    private enum TransitionSwipeDirection {
        case toLeft
        case toRihgt
        case toTop
        case toBottom
    }
    
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
    
    private func recognizerShouldBegin(_ direction: TransitionDirection, gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let view = self.view else { return false }
        let point = location(in: view)
        guard point.x > 0, point.x < view.frame.width, point.y > 0, point.y < view.frame.height else { return false}
        switch direction {
        case .left:
            offSet = min(offSet, view.frame.width)
            return (point.x < offSet) && getSwipeDirection(self, view: view) == .toRihgt
        case .top:
            offSet = min(offSet, view.frame.height)
            return point.y < offSet && getSwipeDirection(self, view: view) == .toBottom
        case .right:
            offSet = min(offSet, view.frame.width)
            return (view.frame.width - point.x) < offSet && getSwipeDirection(self, view: view) == .toLeft
        case .bottom:
            offSet = min(offSet, view.frame.height)
            return (view.frame.height - point.y) < offSet && getSwipeDirection(self, view: view) == .toTop
        case .leftOffset(let leftOffset):
            offSet = min(offSet, view.frame.width - leftOffset)
            return ((point.x > leftOffset) && (point.x < (view.frame.width - leftOffset + offSet))) && getSwipeDirection(self, view: view) == .toRihgt
        case .rightOffset(let rightOffset):
            offSet = min(offSet, view.frame.width - rightOffset)
            return ((point.x < (view.frame.width - rightOffset)) && (point.x > (view.frame.width - rightOffset - offSet))) && getSwipeDirection(self, view: view) == .toLeft
        case .topOffset(let topOffset):
            offSet = min(offSet, view.frame.height - topOffset)
            return ((point.y > topOffset) && (point.y < topOffset + offSet)) && getSwipeDirection(self, view: view) == .toBottom
        case .bottomOffset(let bottomOffset):
            offSet = min(offSet, view.frame.height - bottomOffset)
            return ((point.y < (view.frame.height - bottomOffset)) && (point.y > (view.frame.height - bottomOffset - offSet))) && getSwipeDirection(self, view: view) == .toTop
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
