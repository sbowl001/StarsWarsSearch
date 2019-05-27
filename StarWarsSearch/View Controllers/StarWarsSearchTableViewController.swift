//
//  StarWarsSearchTableViewController.swift
//  StarWarsSearch
//
//  Created by Stephanie Bowles on 5/26/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class StarWarsSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: Properties and Outlets
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    let personController = PersonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
    }

    // MARK: - Table view data source

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.searchBar.text else {
            return
        }
        self.personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.personController.people.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else {return UITableViewCell()}

        let person = self.personController.people[indexPath.row]
        cell.person = person 

        return cell
    }
   
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//        
//    }
    

}
