//
//  ComicsCollectionViewCell.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit
import SDWebImage

class ComicBookCollectionViewCell: UICollectionViewCell {
    
    //Acitvity Indicator
    let activityIndicator = LoadingIndicator()
    
    ///Property Observer for cell data
    
    var cellData: Comic?{
        didSet {
            
            if let name = cellData?.title{
                comicTitle.text =  name
            }else{
                comicTitle.text  = "Loading..."
            }
            activityIndicator.displayLoader(view: self.comicBookCover)
            activityIndicator.startAnimating()
            if let path = cellData?.cover?.path,let ext = cellData?.cover?.fileExtension {
                let imageURL = URL(string: path + "." + ext)
                comicBookCover.sd_setImage(with: imageURL) { [weak self](_, _, _, _) in
                    self?.activityIndicator.stopAnimating()
                }
            }else{
                    comicBookCover.image = UIImage(named: "marvel")
                    self.activityIndicator.stopAnimating()
                }
            }
            
        }
    
    
    /**
     - Comic Book ImageView
     - Comic Title Label
     */
    
    var comicBookCover: UIImageView = {
        let cover = UIImageView()
        cover.contentMode = .scaleAspectFill
        cover.clipsToBounds = true
        cover.layer.masksToBounds = true
        cover.translatesAutoresizingMaskIntoConstraints = false
        return cover
    }()
    
    var comicTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: heroFontName, size: 17)
        title.textColor = .black
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        self.clipsToBounds = true
        displayCellContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func displayCellContent(){
        
        contentView.addSubview(comicBookCover)
        contentView.addSubview(comicTitle)
        
        let constraints  = [
            comicBookCover.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            comicBookCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            comicBookCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            comicBookCover.heightAnchor.constraint(lessThanOrEqualToConstant: 160),
            
            comicTitle.topAnchor.constraint(equalTo: comicBookCover.bottomAnchor, constant: 15),
            comicTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            comicTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            contentView.bottomAnchor.constraint(equalTo: comicTitle.bottomAnchor)
        ]
       
        NSLayoutConstraint.activate(constraints)
        
        
                          
    }
    
}
