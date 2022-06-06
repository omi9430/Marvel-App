//
//  SearchBarMethods.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit

extension HomeChractersView: UISearchControllerDelegate,UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        
        if !searchText.isEmpty{
            
            isSeaarching = true
            searchedData.removeAll()
            
            for character in chractersData{
                if character.name!.lowercased().contains(searchText.lowercased()){
                    searchedData.append(character) // append the searched item in the searched array
                }
            }
        }else {
            isSeaarching = false
            searchedData.removeAll()
            searchedData = chractersData
        }
        
        DispatchQueue.main.async { [weak self]  in
            self?.collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSeaarching = false
        searchedData.removeAll()
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    
    
}
