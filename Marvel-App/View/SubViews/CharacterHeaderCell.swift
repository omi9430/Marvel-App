//
//  CharacterHeaderCell.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit

class CharacterHeaderTableViewCell: UITableViewCell {
    
    var profileHolderView: UIView = {
        let holder = UIView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.clipsToBounds = true
      
        return holder
    }()
    
    var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.clipsToBounds = true
        return profileImage
    }()
    var nameOfHero: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: heroFontName, size: 40)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        layoutTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    fileprivate func layoutTableViewCell(){
        
        contentView.addSubview(nameOfHero)
        contentView.addSubview(profileHolderView)
        profileHolderView.addSubview(profileImage)
        
        var height = nameOfHero.constraints.filter{$0.firstAttribute == .height}.first?.constant ?? 60
        height = height / 2
       
        let constraints = [
            profileHolderView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            profileHolderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            profileHolderView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            profileHolderView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            
            profileImage.leadingAnchor.constraint(equalTo: profileHolderView.leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: profileHolderView.topAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileHolderView.widthAnchor),
            profileImage.heightAnchor.constraint(equalTo: profileHolderView.heightAnchor),
            
            nameOfHero.centerYAnchor.constraint(equalTo:profileHolderView.centerYAnchor),
            contentView.bottomAnchor.constraint(equalTo: nameOfHero.bottomAnchor, constant: height + 20) // 10 is for the padding of the bottom of the cell
        
        ]
 
        NSLayoutConstraint.activate(constraints)
    }
    
}
