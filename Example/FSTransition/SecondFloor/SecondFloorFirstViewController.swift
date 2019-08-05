//
//  SecondFloorFirstViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class SecondFloorFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fs_registerToInteractiveTransition([.topOffset(82.0)]) {[weak self] in
            let animation = SecondFloorTransitionAnimation.init(topOffset: 82.0)
            let vc = SecondFloorSecondViewController.init(nibName: "SecondFloorSecondViewController", bundle: nil)
            self?.fs_pushViewController(vc, animation: animation)
        }
    }
}
