//
//  ScrollViewSecondViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/31.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ScrollViewSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fs_registerBackInteractiveTransition([.bottom], view: view, responseOffset: view.frame.height) {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
