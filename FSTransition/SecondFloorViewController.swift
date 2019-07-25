//
//  SecondFloorViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class SecondFloorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animation = SecondFloorTransitionAnimation.init(topOffset: 88)
        fs_registerToInteractiveTransition([.topOffset(88)]) {
            let vc = InteractiveViewController.init(nibName: "InteractiveViewController", bundle: nil)
            self.fs_pushViewController(vc, animation: animation)
        }
    }
}
