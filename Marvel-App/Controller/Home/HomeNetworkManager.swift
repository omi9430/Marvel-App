//
//  HomeChractersLogic.swift
//  Marvel-App
//
//  Created by omair khan on 01/06/2022.
//

import Foundation

extension HomeChractersView {
    
    
    
    func getHomeData(completionHandler: @escaping(() -> Void)) {
        
        HttpUtility.getApiData(url: networkApi.getChracters(), resultType: ChracterData.self) {[weak self] result in
            /// get result from the data
            guard let result = result.data.characters else {
                return  
            }
            self?.chractersData = result
            /// Return the result array  in completion block
            completionHandler()
        }
        
    }
    
}
