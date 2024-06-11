//
//  BreweryWebAdaptor.swift
//  Breweries
//
//  Created by Timblo, Adi (WING) on 11/06/2024.
//

import Foundation

class BreweryWebAdaptor {
    static let shared = BreweryWebAdaptor()
    
    private init() {}
    
    private let baseUrl = "https://api.openbrewerydb.org/v1/breweries/"
    private let decoder = JSONDecoder()
    
    func search(for query:String, completion: @escaping ([BreweryLightweight]) -> Void){
        //make a url object
        let query = "autocomplete?query=\(query)"
        guard let url = URL(string: baseUrl + query) else {
            print("Invaid URL")
            return
        }
        
    
        //make a url session dataTask (object for calling a Web API using a url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data, let results = try? self.decoder.decode([BreweryLightweight].self, from: data) else{
                print("Error decoding JSON")
                return
            }
            completion(results)
        }
        //Run this dataTask (initiate)
        task.resume()
 
    }
    
    func singleBrewery(for query:String, completion: @escaping (Brewery) -> Void) {
        let query = query
        
        guard let url = URL(string: baseUrl + query) else {
            print("Invaid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data, let results = try? self.decoder.decode(Brewery.self, from: data) else{
                print("Error decoding JSON")
                return
            }
            completion(results)
        }
        //Run this dataTask (initiate)
        task.resume()
 
    }
    
}
