//
//  CollectionSecondViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/26.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit


class CollectionSecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
