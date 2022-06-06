//
//  CharacterDescriptionCell.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit
class CharacterDescriptionTableViewCell: UITableViewCell {
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        displayLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK:- Layout
    fileprivate func displayLayout(){
        
        contentView.addSubview(descriptionLabel)
        let constraints = [
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
}
