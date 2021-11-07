//
//  DetailsViewController.swift
//  HarryPotterCharacters
//
//  Created by Matthew Hollyhead on 05/11/2021.
//

import UIKit

class DetailsViewController: UITableViewController {
    
    var arrayName: String?
    var charactersArray: [String]?
    
    init?(coder: NSCoder, name: String, array: [String]) {
        self.arrayName = name
        self.charactersArray = array
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) did not run")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets title on navigation bar to arrayName
        title = arrayName
        
        // Sorts array into alphabetical order
        charactersArray = charactersArray?.sorted()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as? NameCell else {
            fatalError("Unable to dequeue Name Cell")
        }
        
        let characterName   = charactersArray?[indexPath.row]
        
        // Sets nameLabel text to characterName in tableViewCell
        cell.nameLabel.text = characterName

        return cell
    }
}
