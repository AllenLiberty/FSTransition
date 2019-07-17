//
//  FSinteractiveTransition.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class FSInteractiveTransition: UIPercentDrivenInteractiveTransition{
    
    var isPanGestureIneration = false
    public var eventBlock: (() -> ())?
    private weak var gestureView: UIView?
    
    func addEdgePageGesture(_ view: UIView, direction: UIRectEdge){
        let popRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(handlePopRecognizer(_:)))
        popRecognizer.edges = direction
        gestureView = view
        view.addGestureRecognizer(popRecognizer)
    }
    
    @objc func handlePopRecognizer(_ recognizer: UIPanGestureRecognizer){
        var progress = fabsf(Float(recognizer.translation(in: gestureView!).x)) / Float(gestureView!.bounds.width)
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
}
