//
//  LaunchAnimation.swift
//  Marvel-App
//
//  Created by omair khan on 05/06/2022.
//

import Foundation
import UIKit

class LaunchAnimation: UIViewController {
    
    /**
     - Holder View
     - Labels For Each Character
     - Reference to Constraints
     */
    
    let holderView: UIView = {
        var view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    let mLabel : UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.alpha = 0
        lbl.textAlignment = .center
        lbl.font = UIFont(name: heroFontName, size: 40)
        lbl.text = "MARVEL"
        return lbl
    }()
  
    
    var mLabelConstraint: NSLayoutConstraint?
    var centerConstraint: NSLayoutConstraint?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setUpView()
        animate()
    }
    
    
    func setUpView(){
        
        self.view.addSubview(mLabel)
        
        mLabel.center.x = self.view.center.x
        mLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
        
        mLabelConstraint = mLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -1000)
        mLabelConstraint?.isActive = true
        centerConstraint = mLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    }
    
    
    func animate() {

        mLabelConstraint?.isActive = false
       
        centerConstraint?.isActive = true
        
        UIView.animate(withDuration: 5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: []) {
            self.mLabel.alpha = 1
            self.view.layoutIfNeeded()
        } completion: { _ in
            
            /// Present homeVC on animation completion
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
                let vc = HomeChractersView()
                let navController = UINavigationController(rootViewController: vc)
                
                navController.modalPresentationStyle = .fullScreen // FullScreen presentation for the VC
                navController.modalTransitionStyle = .flipHorizontal // Flip the VC prresentation
               
                self?.present(navController, animated: true)
            }
       

        }



        
    }
}
