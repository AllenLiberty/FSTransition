//
//  SecondFloorSecondViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class SecondFloorSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerBackInteractiveTransition([.bottomOffset(50.0)]) {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
