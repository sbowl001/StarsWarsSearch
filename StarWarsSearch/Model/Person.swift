//
//  Person.swift
//  StarWarsSearch
//
//  Created by Stephanie Bowles on 5/26/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

struct Person: Decodable  {
    let name: String
    let gender: String
    let birthYear: String
    
}

struct PersonSearch: Decodable {
    let results: [Person]
}
