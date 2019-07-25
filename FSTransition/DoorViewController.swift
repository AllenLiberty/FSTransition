//
//  DoorViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/22.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class DoorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fs_registerToInteractiveTransition([.leftOffset(self.view.frame.width / 2.0),.rightOffset(self.view.frame.width / 2.0)]) { [weak self] in
            let animation = OpenMiddleTranstionAnimation()
            let vc = InteractiveViewController.init(nibName: "InteractiveViewController", bundle: nil)
            self?.fs_presentViewController(vc, animation: animation)
        }
    }
}
