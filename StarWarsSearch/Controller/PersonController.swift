//
//  PersonController.swift
//  StarWarsSearch
//
//  Created by Stephanie Bowles on 5/26/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

class PersonController {
    
    //1. Base URL
    //2. Set up URL Components and Query items
    //3. Add query items to URL Components
    //4. Get final URL from URL Components
    //5. Create URL Request with URL
    //6. Set HTTP Method
    //7. Create data task with URL Request
    //  a. handle errors
    //  b. safely unwrap data
    //  c. decode data (set strategy if necessary)
    //  d. set self.people = decodedData 
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    var people: [Person]  = []
    
    let baseURL = URL(string: "https://swapi.co/api/people")!
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        // up to here gives the right url link to paste
        
        guard let requestURL = urlComponents?.url else {NSLog("requestURL is nil"); completion(); return}
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data \(error)")
                completion()
                return
            }
            guard let data = data else {
                NSLog("No data returned from data task")
                completion()
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                NSLog("Unable to decode data into object of type [Person]: \(error)")
            }
            completion()
            
        } .resume()
    }
    
}
