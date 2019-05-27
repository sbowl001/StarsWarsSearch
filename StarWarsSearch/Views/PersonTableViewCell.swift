//
//  PersonTableViewCell.swift
//  StarWarsSearch
//
//  Created by Stephanie Bowles on 5/26/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    var person: Person? {
        didSet {
            self.updateViews()
            
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var birthYearLabel: UILabel!
    
    private func updateViews(){
        guard let person = self.person else {return}
        self.nameLabel.text = person.name
        self.genderLabel.text = "Gender: \(person.gender)"
        self.birthYearLabel.text = "Birth Year: \(person.birthYear)"
    }
}
