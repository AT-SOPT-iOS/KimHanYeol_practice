//
//  ItemCollectionViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/26/25.
//

import UIKit

import SnapKit
import Then

class ItemCollectionViewController: UIViewController {
    private let model = ItemModel.dummy()
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
 
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        collectionView.do {
            let layout = UICollectionViewFlowLayout()
            $0.collectionViewLayout = layout
            $0.register(
                ItemCollectionViewCell.self,
                forCellWithReuseIdentifier: ItemCollectionViewCell
                    .cellIdentifier)
            $0.delegate = self
            $0.dataSource = self
        }
        
    }
    
}

extension ItemCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell
                .cellIdentifier,
            for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: model[indexPath.row])
        
        return cell
    }
}

extension ItemCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return carrotLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return carrotInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return carrotInset
    }
}
