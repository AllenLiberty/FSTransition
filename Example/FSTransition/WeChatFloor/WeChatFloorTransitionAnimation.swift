//
//  WeChatFloorAnimation.swift
//  FSTransition_Example
//
//  Created by allen_wu on 2019/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import FSTransition

class WeChatFloorTransitionAnimation: FSTransitionAnimationProtocol {
    
    var snapToView: UIView?
    
    var snapFromView: UIView?
    
    func setToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = self.snapToView else {
            return
        }
        guard let snapFromView = self.snapFromView else {
            return
        }
        
        let rect = containerView.bounds
        let maskView = UIView(frame: containerView.bounds)
        maskView.backgroundColor = UIColor(red: 51.0/255.0, green: 49.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        containerView.addSubview(maskView)
        
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapToView.frame = CGRect(x: rect.width * 0.2, y: 0.0, width: rect.width * 0.6, height: rect.height * 0.6)
        
        
        
        
        let backgroundView = UIView(frame: containerView.bounds)
        backgroundView.backgroundColor = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        containerView.addSubview(backgroundView)
        backgroundView.frame = CGRect(origin: CGPoint(x: 0, y: -containerView.frame.height), size: containerView.frame.size)
        
        let indecatiorWidth: CGFloat = 100.0
        let indecatiorHeight: CGFloat = 20.0
        let indecatiorView = WechatIndecatiorView.init(frame: CGRect(x: (backgroundView.frame.width - indecatiorWidth) / 2.0, y: backgroundView.frame.height - 30.0, width: indecatiorWidth, height: indecatiorHeight))
        backgroundView.addSubview(indecatiorView)
        
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.02, relativeDuration: 0.1, animations: {
                indecatiorView.action1()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.1, animations: {
                indecatiorView.action2()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8, animations: {
                backgroundView.alpha = 0.0
                snapToView.frame = rect
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                snapFromView.frame = CGRect(origin: CGPoint(x: 0, y: snapFromView.frame.height), size: snapFromView.frame.size)
                backgroundView.frame = containerView.bounds
            })
        }) { (finished) in
            backgroundView.removeFromSuperview()
            maskView.removeFromSuperview()
            animationComplete()
        }
    }
    
    func backToAnimation(_ fromView: UIView, toView: UIView, containerView: UIView, animationComplete: @escaping (() -> ())) {
        guard let snapToView = self.snapToView else {
            return
        }
        guard let snapFromView = self.snapFromView else {
            return
        }
        containerView.addSubview(snapToView)
        containerView.addSubview(snapFromView)
        snapToView.frame.origin = CGPoint(x: 0, y: containerView.frame.height)
        UIView.animate(withDuration: 0.5, animations: {
        snapToView.frame = containerView.bounds
        snapFromView.frame.origin = CGPoint(x: 0, y: -containerView.frame.height)
        }) { (finished) in
            animationComplete()
        }
    }
}


class WechatIndecatiorView: UIView {
    let sizeLarge = CGSize(width: 16.0, height: 16.0)
    let sizeSmall = CGSize(width: 10.0, height: 10.0)
    
    lazy var leftView: UIImageView = getImageView()
    lazy var middleView: UIImageView = getImageView()
    lazy var rightView: UIImageView = getImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftView)
        leftView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        addSubview(rightView)
        rightView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        addSubview(middleView)
        middleView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
    }
    
    func action1(){
        self.middleView.frame.size = sizeLarge
        middleView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        self.leftView.frame = CGRect(origin: self.middleView.frame.origin
            , size: sizeSmall)
        leftView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        self.rightView.frame = CGRect(origin:self.middleView.frame.origin
            , size: sizeSmall)
        rightView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
    }
    
    func action2(){
        self.middleView.frame = CGRect(origin: self.middleView.frame.origin, size: sizeSmall)
        middleView.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        self.leftView.frame = CGRect(origin: CGPoint(x: 0, y: self.leftView.frame.origin.y)
            , size: sizeSmall)
        self.rightView.frame = CGRect(origin: CGPoint(x: self.frame.width - sizeSmall.width, y: self.leftView.frame.origin.y)
            , size: sizeSmall)
    }
    
    func getImageView() -> UIImageView{
        let imageView = UIImageView()
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: .zero)
        imageView.image = UIImage(named: "circle.png")
        return imageView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
