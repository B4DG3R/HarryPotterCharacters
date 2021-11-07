//
//  DetailsViewController.swift
//  HarryPotterCharacters
//
//  Created by Matthew Hollyhead on 05/11/2021.
//

import UIKit

class DetailsViewController: UITableViewController {
    
    var arrayName: String?
    var charactersArray: [[String]]?
    var namesArray: [String]?
    
    init?(coder: NSCoder, name: String, array: [[String]]) {
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
        
        // Populates names array
        namesArray = addNamesToArray(array: charactersArray!)
        
        // Sorts array into alphabetical order
        namesArray = namesArray?.sorted()
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as? NameCell else {
            fatalError("Unable to dequeue Name Cell")
        }
        
        let characterName   = namesArray?[indexPath.row]
        
        // Sets nameLabel text to characterName in tableViewCell
        cell.nameLabel.text = characterName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = namesArray![indexPath.item]
        var detailsArray: [String] = []
        
        // iterates through characters array, finds correct character details and appends data
        // to the details array so it can be passed to characterDetailsViewController
        for character in charactersArray! {
            if name == character[0] {
                detailsArray = character
            }
        }
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "CharacterDetailsViewController", creator: { coder in
            return CharacterDetailsViewController (coder: coder, nameData: detailsArray[0], genderData: detailsArray[1], dateOfBirthData: detailsArray[3], houseData: detailsArray[2], patronusData: detailsArray[4], actorData: detailsArray[5])
        }) else {
            fatalError("DetailsViewController not found")
        }
        
        // present view controller full screen on navigation stack
        vc.modalPresentationStyle = .overFullScreen
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Takes character names from charactersArray and appends
    // then to names array so they can be listed in tableView
    func addNamesToArray(array: [[String]]) -> [String] {
        var namesArray: [String] = []
        
        for name in array {
            namesArray.append(name[0])
        }
        
        return namesArray
    }
    
}
