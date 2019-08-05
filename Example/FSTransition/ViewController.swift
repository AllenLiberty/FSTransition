//
//  ViewController.swift
//  FSTransition
//
//  Created by Allen0002 on 08/02/2019.
//  Copyright (c) 2019 Allen0002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func scaleTransition(_ sender: Any) {
        let vc = ScaleFristViewController.init(nibName: "ScaleFristViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sliderTransition(_ sender: Any) {
        let vc = SliderFirstViewController.init(nibName: "SliderFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func collectionTransition(_ sender: Any) {
        let vc = CollectionFirstViewController.init(nibName: "CollectionFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func openDoorTransition(_ sender: Any) {
        let vc = OpenDoorFirstViewController.init(nibName: "OpenDoorFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func openMiddleTransition(_ sender: Any) {
        let vc = OpenMiddleFirstViewController.init(nibName: "OpenMiddleFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func secondFloorTransition(_ sender: Any) {
        let vc = SecondFloorFirstViewController.init(nibName: "SecondFloorFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func scrollFloorTransition(_ sender: Any) {
        let vc = ScrollViewFirstViewController.init(nibName: "ScrollViewFirstViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

