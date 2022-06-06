//
//  HomeChractersCell.swift
//  Marvel-App
//
//  Created by omair khan on 01/06/2022.
//

import UIKit
import SDWebImage

class HomeChractersCell: UICollectionViewCell {
    
    var activityIndicator = LoadingIndicator()
    
     //Using Prooperty Observer to Set Cell Data

    var  cellData: Result? {
        didSet {

            if let name = cellData?.name {
                nameLabel.text = name
            }else {
                nameLabel.text = "Loading..."
            }

            activityIndicator.displayLoader(view: self.customImageView)
            activityIndicator.startAnimating()
            if let  imageUrl = cellData?.thumbnail?.path,let ext = cellData?.thumbnail?.fileExtension {
                let url = URL(string: imageUrl + "." + ext)
                
                customImageView.sd_setImage(with: url) { [weak self](image, error, _, _) in
                    self?.activityIndicator.stopAnimating()
                }
              
            }else{
                customImageView.image = UIImage(named: "marvel")
                activityIndicator.stopAnimating()
            }

        }
    }
    
    
    /**
     - View For Image
     - Image View
     - Label for Name
     */
    
    let viewForImage: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let customImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel : UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .red
        label.textAlignment = .center
        label.backgroundColor  = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setUpViews()
    }
    
    
    func setUpViews(){
        self.viewForImage.addSubview(customImageView)
        self.contentView.addSubview(viewForImage)
        self.contentView.addSubview(nameLabel)
        
        let constraints = [
                
            // View for Image
            self.viewForImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.viewForImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.viewForImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            self.viewForImage.bottomAnchor.constraint(equalTo: self.nameLabel.topAnchor, constant: 0),
            
            // Image View
            self.customImageView.topAnchor.constraint(equalTo: self.viewForImage.topAnchor, constant: 0),
            self.customImageView.leadingAnchor.constraint(equalTo: self.viewForImage.leadingAnchor, constant: 0),
            self.customImageView.trailingAnchor.constraint(equalTo: self.viewForImage.trailingAnchor, constant: 0),
            self.customImageView.bottomAnchor.constraint(equalTo: self.viewForImage.bottomAnchor, constant: 0),
            
            //Name Label
           // self.nameLabel.topAnchor.constraint(equalTo: self.viewForImage.bottomAnchor, constant: 0),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.nameLabel.heightAnchor.constraint(equalToConstant: self.contentView.layer.frame.height/14)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
