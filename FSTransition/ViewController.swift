//
//  ViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fs_registerToInteractiveTransition(.leftOffset(200)) { [weak self] in
            let animation = OpenDoorTranstionAnimation()
            let vc = InteractiveViewController.init(nibName: "InteractiveViewController", bundle: nil)
            self?.fs_presentViewController(vc, animation: animation)
        }
    }

    @IBAction func onPushAnimation(_ sender: Any) {
        let animation = SliderTransitionAnimation()
        let vc = TestViewController.init(nibName: "TestViewController", bundle: nil)
        self.fs_pushViewController(vc, animation: animation)
    }
    
    @IBAction func onPushNormal(_ sender: Any) {
        let vc = TestViewController.init(nibName: "TestViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onPresentAnimation(_ sender: Any) {
        let animation = ScaleTransitionAnimation()
        let vc = TestViewController.init(nibName: "TestViewController", bundle: nil)
        self.fs_presentViewController(vc, animation: animation)
    }
    
    @IBAction func onPresentNormal(_ sender: Any) {
        let vc = TestViewController.init(nibName: "TestViewController", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}

