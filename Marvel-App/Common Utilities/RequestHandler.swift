//
//  NetworkAPI.swift
//  Marvel-App
//
//  Created by omair khan on 01/06/2022.
//

import Foundation

class RequestHandler {
    
    let baseUrl = "https://gateway.marvel.com:443/"
    
    func getChracters() -> URLRequest {
        let endPoint = "/v1/public/characters"
        let url = baseUrl + endPoint + buildQueryString()
        /// Create a  request  from provided URL
        let request = URLRequest(url: URL(string: url)!)
        return request
    }
    
    /// Get Comics by using Character ID
    func getComics(id: Int) -> URLRequest{
        /// Request to fetch comics by character id
        let endpoint = "/v1/public/characters/\(id)/comics"
        let url = baseUrl + endpoint + buildQueryString()
        
        let request = URLRequest(url: URL(string: url)!)
        return request
        
    }
    
    private func buildQueryString() -> String {
        /// Build the query for  the API
        let timeStamp = Date().timeIntervalSince1970
        let queryString = "?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(buildHashToken(timestamp: timeStamp))"
        return queryString
    }
    
    
    private func buildHashToken(timestamp: TimeInterval) -> String{
        // Generating MD5 hash as per Marvel API requirement
        let unhashedString = "\(timestamp)" + privateKey + publicKey
        return MD5(str: unhashedString)
    }
}
