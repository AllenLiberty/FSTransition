//
//  WeChatFloorDetailViewController.swift
//  FSTransition_Example
//
//  Created by allen_wu on 2019/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class WeChatFloorDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fs_registerBackInteractiveTransition([.bottom], view: view, responseOffset: view.frame.height) {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
