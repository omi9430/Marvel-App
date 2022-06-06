//
//  NetworkManagerr.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation

extension CharacterDetailView {
    
/// Fetch the &  Decode the data  from the server

    func getCharacterComics(id:Int, compeletionHandler: @escaping(() ->  Void)) {
        
        HttpUtility.getApiData(url: requestHandler.getComics(id: id), resultType: ComicData.self) { [weak self] result in
            /// if data is not nil
            guard result.data?.comics != nil else{
                return
            }
            /// Assign the data to local array
            self?.arrayOfComics = (result.data?.comics!)!
            compeletionHandler()
        }
       
    }
    
}

