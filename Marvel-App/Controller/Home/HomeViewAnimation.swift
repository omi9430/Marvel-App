//
//  HomeViewAnimation.swift
//  Marvel-App
//
//  Created by omair khan on 05/06/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func animateButton(){
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .transitionCurlUp) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)// Decrease the size
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity // resize to orginal
            }
        }

    }
}
