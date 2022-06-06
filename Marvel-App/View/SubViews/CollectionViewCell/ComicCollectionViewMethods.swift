//
//  ComicCollectionViewMethods.swift
//  Marvel-App
//
//  Created by omair khan on 05/06/2022.
//

import Foundation
import UIKit
import SDWebImage

extension ComicsTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    
    //MARK: - CollectionView Data Source 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = comics[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicBooksCell", for: indexPath) as! ComicBookCollectionViewCell
        cell.cellData = data
        return cell
    }
    
    
    
}
