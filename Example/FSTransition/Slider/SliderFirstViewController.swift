//
//  SliderFirstViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class SliderFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSliderPush(_ sender: Any) {
        let animation = SliderTransitionAnimation()
        let vc = SliderSecondViewController.init(nibName: "SliderSecondViewController", bundle: nil)
        fs_presentViewController(vc, animation: animation)
    }
}
