//
//  LoadingIndicator.swift
//  Marvel-App
//
//  Created by omair khan on 05/06/2022.
//

import Foundation
import UIKit

final class LoadingIndicator {
    
    var loadingIndicator: UIActivityIndicatorView = {
        
        var loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .black
        return loader
    }()
    
    func displayLoader(view: UIView){
        ///This function will take the view as a parameter where you want to display the loading indicator
        view.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func startAnimating(){
        loadingIndicator.startAnimating()
    }
    
    func stopAnimating(){
        loadingIndicator.stopAnimating()
        loadingIndicator.removeFromSuperview()
    }
}
