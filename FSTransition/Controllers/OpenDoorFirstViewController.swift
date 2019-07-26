//
//  OpenDoorFirstViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/24.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class OpenDoorFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fs_registerToInteractiveTransition([.left]) {[weak self] in
            let animation = OpenDoorTranstionAnimation()
            let vc = OpenDoorSecondViewController.init(nibName: "OpenDoorSecondViewController", bundle: nil)
            self?.fs_pushViewController(vc, animation: animation)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    @IBAction func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
