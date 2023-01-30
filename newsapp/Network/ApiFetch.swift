//
//  ApiFetch.swift
//  newsapp
//
//  Created by Apple on 29/01/2023.
//

import Foundation


///Mark: class for fetching of api from network
class Apifetch {
    
    static let shared = Apifetch()
    
    
    
    func getnews(completion: @escaping (Result<[Article], Error >) -> Void ){
        ///check the url if its nil
        guard let url = URL(string:"https://newsapi.org/v2/everything?q=tesla&from=2022-12-30&sortBy=publishedAt&apiKey=2175e32379014610a8844d5da0a02a32") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { Data, _ ,error in
            guard let  Data = Data  , error == nil else {
                return
            }
            
            do {
             let results = try JSONDecoder().decode( jermaine.self,from: Data)
                ///Mark: print out the statement to check if the url or json is functioning
        // let jermaine = try JSONSerialization.jsonObject(with: Data, options: .fragmentsAllowed)
                completion(.success(results.articles))
              
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    
}
