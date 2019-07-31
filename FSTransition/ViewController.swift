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
    }

    @IBAction func onScale(_ sender: Any){
        let vc = ScaleFristViewController.init(nibName: "ScaleFristViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onSlider(_ sender: Any) {
        let vc = SliderFirstViewController.init(nibName: "SliderFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onOpenDoor(_ sender: Any) {
        let vc = OpenDoorFirstViewController.init(nibName: "OpenDoorFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onOpenMiddle(_ sender: Any) {
        let vc = OpenMiddleFirstViewController.init(nibName: "OpenMiddleFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onSecondFloor(_ sender: Any) {
        let vc = SecondFloorFirstViewController.init(nibName: "SecondFloorFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pushCollection(_ sender: Any) {
        let vc = ScrollViewFirstViewController.init(nibName: "ScrollViewFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
//        let vc = CollectionFirstViewController.init(nibName: "CollectionFirstViewController", bundle: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

