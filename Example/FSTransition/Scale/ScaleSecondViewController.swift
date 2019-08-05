//
//  ScaleSecondViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ScaleSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
