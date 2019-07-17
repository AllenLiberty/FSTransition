//
//  InteractiveViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/17.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class InteractiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = SliderTransitionAnimation()
        fs_registerBackInteractiveTransition(.left, animation: animation) {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}
