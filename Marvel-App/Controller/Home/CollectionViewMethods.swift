//
//  CollectionViewMethods.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit

extension HomeChractersView: UICollectionViewDataSource,UICollectionViewDelegate {

    //MARK: - CollectionView Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return isSeaarching == true ? searchedData.count : chractersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = isSeaarching  == true ? searchedData[indexPath.row] : chractersData [indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Characters", for: indexPath) as! HomeChractersCell
        cell.cellData = data
        
        return cell
    }
    
    //TODO: Did Select Item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = chractersData[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.animateButton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
            let vc  = CharacterDetailView(_character: selectedCharacter )
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}
