//
//  OpenMiddleSecondViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class OpenMiddleSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        fs_registerBackInteractiveTransition([.left, .right]) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
