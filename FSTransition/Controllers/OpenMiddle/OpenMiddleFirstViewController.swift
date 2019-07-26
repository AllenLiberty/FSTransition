//
//  OpenMiddleFirstViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class OpenMiddleFirstViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fs_registerToInteractiveTransition([.leftOffset(view.frame.width / 2.0), .rightOffset(view.frame.width / 2.0)]) {
            let animation = OpenMiddleTranstionAnimation()
            let vc = OpenMiddleSecondViewController.init(nibName: "OpenMiddleSecondViewController", bundle: nil)
            self.fs_pushViewController(vc, animation: animation)
        }
    }
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
