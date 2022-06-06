//
//  ComicsTableViewCell.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit

final class ComicsTableViewCell: UITableViewCell {
    
    /**
     - A collectionView to display the comic books filtered by charachter id
     - An Array to return comics data
     */
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 130, height: 290)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        //        collection.contentInsetAdjustmentBehavior = .never
        return collection
    }()
    
    var comics = [Comic]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    fileprivate func setUpCollectionView(){
        contentView.addSubview(collectionView)
        
        //Set Delegate and DataSource
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // register the cell
        collectionView.register(ComicBookCollectionViewCell.self, forCellWithReuseIdentifier: "ComicBooksCell")
        
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 310),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
  
    }
    
}
