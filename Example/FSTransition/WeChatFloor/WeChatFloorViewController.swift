//
//  WeChatFloorViewController.swift
//  FSTransition_Example
//
//  Created by allen_wu on 2019/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class WeChatFloorViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        self.scrollView.delegate = self
        registerTransition()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            registerTransition()
        }else{
            resignTransition()
        }
    }
    
    func registerTransition() {
        fs_registerToInteractiveTransition([.top], view: contentView, responseOffset: view.frame.height, progress: 0.3) {[weak self] in
            let animation = WeChatFloorTransitionAnimation()
            let vc = WeChatFloorDetailViewController.init(nibName: "WeChatFloorDetailViewController", bundle: nil)
            self?.fs_pushViewController(vc, animation: animation)
        }
    }
    
    func resignTransition(){
        self.fs_resignInteractiveTransition()
    }
    
}

