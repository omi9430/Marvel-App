//
//  TableViewMethods.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit
import SDWebImage

extension CharacterDetailView: UITableViewDelegate,UITableViewDataSource {
    
    //MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.section
        
        switch index {
        case 0:
            /// Return the Header Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterHeader", for: indexPath) as! CharacterHeaderTableViewCell
            
            let url = URL(string: (chracter?.thumbnail?.path)! + "." + (chracter?.thumbnail?.fileExtension)!)
            cell.profileImage.sd_setImage(with: url , completed: nil)
            return cell
        case 1:
        /// Return Description Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDescription", for: indexPath) as! CharacterDescriptionTableViewCell
            if cell.descriptionLabel.text == "" {
                cell.descriptionLabel.text = "No Description Available"
            }else{
                cell.descriptionLabel.text = chracter?.resultDescription
            }
            
            return cell
        case 2:
        /// Return Comic Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "ComicTableViewCell", for: indexPath) as! ComicsTableViewCell
            cell.comics = arrayOfComics
            /// Reload the collectionView after passing the data
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
            return cell
        default:
            fatalError()
        }
     
       
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return  setUpHeaderView(title: "Character Bio", tableView: tableView)
        }else if section == 2 {
            return  setUpHeaderView(title: "Character Comics", tableView: tableView)
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 {
            return 60
        }else{
            return 0
        }
    }
    
    //MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section {
        case 0:
            return  self.view.frame.height/2.5
        case 1:
            return self.view.frame.height/4
        case 2:
            return self.view.frame.height/3
        default:
            fatalError()
        }
    }
    
    
}
