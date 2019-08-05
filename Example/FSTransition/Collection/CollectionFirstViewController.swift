//
//  CollectionFirstViewController.swift
//  FSTransition
//
//  Created by allen_wu on 2019/7/26.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class CollectionFirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName:"CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath)else {return}
        let rect = collectionView.convert(cell.frame, to: self.view)
        guard let snapCell = cell.snapshotView(afterScreenUpdates: true) else { return }
        
        let animation = CollectionTransitionAnimation.init(rect, snapCell: snapCell)
        let vc = CollectionSecondViewController.init(nibName: "CollectionSecondViewController", bundle: nil)
        self.fs_pushViewController(vc, animation: animation)
    }
}
