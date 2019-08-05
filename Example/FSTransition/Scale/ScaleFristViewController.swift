//
//  ScaleFristViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ScaleFristViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onScalePush(_ sender: Any) {
        let animation = ScaleTransitionAnimation()
        let vc = ScaleSecondViewController.init(nibName: "ScaleSecondViewController", bundle: nil)
        self.fs_pushViewController(vc, animation: animation)
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
