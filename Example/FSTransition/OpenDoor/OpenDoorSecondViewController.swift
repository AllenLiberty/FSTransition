//
//  OpenDoorSecondViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class OpenDoorSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerBackInteractiveTransition([.right]) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
