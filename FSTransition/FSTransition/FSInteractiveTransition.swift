//
//  FSinteractiveTransition.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class FSInteractiveTransition: UIPercentDrivenInteractiveTransition,UIGestureRecognizerDelegate{
    
    var isPanGestureIneration = false
    public var eventBlock: (() -> ())?
    private weak var gestureView: UIView?
    
    func addEdgePageGesture(_ view: UIView, direction: UIRectEdge){
        let popRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(handlePopRecognizer(_:)))
        popRecognizer.edges = direction
        popRecognizer.delegate = self
        gestureView = view
        view.addGestureRecognizer(popRecognizer)
    }
    
    @objc func handlePopRecognizer(_ recognizer: UIScreenEdgePanGestureRecognizer){
        var progress:Float = 0.0
        switch recognizer.edges {
        case .left, .right, .all:
            progress = fabsf(Float(recognizer.translation(in: gestureView!).x)) / Float(gestureView!.bounds.width)
        case .top, .bottom:
            progress = fabsf(Float(recognizer.translation(in: gestureView!).y)) / Float(gestureView!.bounds.width)
        default:
            break
        }
        progress = min(1.0, max(0.0, progress))
        print("progress:::::\(progress)")
        switch recognizer.state {
        case .began:
            isPanGestureIneration = true
            eventBlock?()
            break
        case .changed:
            update(CGFloat(progress))
            break
        case .cancelled,.ended,.failed:
            isPanGestureIneration = false
            if progress > 0.5{
                finish()
            }else{
                cancel()
            }
            break
        default:
            break
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("")
        return true
    }
}
