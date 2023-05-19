//
//  test.swift
//  PracticeCollectionView
//
//  Created by deebika-pt6680 on 02/05/23.
//

import UIKit

class CompositonalLayout: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = indexPath.section == 0 ? .systemBlue : .systemRed
        cell.layer.cornerRadius = 20
        cell.layer.shadowColor = UIColor.systemRed.cgColor
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createCompositionalLayout())
        collectionView.backgroundColor = .label
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout  {
        let layout = UICollectionViewCompositionalLayout{
            (section: Int, env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.createOneCellLayout()
            default:
                return self.createThreeCellLayout()
            }
        }
        layout.configuration.interSectionSpacing = 20
        
        return layout
    }
    
    
//    let colorView: UIView = {
//        let colorView =  UIView()
//        colorView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            colorView.heightAnchor.constraint(equalToConstant: 30),
//            colorView.widthAnchor.constraint(equalToConstant: 40)
//        ])
//        return colorView
//    }()
    
    func createThreeCellLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
        group.interItemSpacing = .fixed(10)
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .continuous
//        layoutSection.interGroupSpacing = 5
        return layoutSection
    }
    
    
    func createOneCellLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.interGroupSpacing = 15
        return layoutSection
    }
}

    

