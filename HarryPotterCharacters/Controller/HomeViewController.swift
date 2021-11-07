//
//  HomeViewController.swift
//  HarryPotterCharacters
//
//  Created by Sean Startin on 23/06/2021.
//

import UIKit
import Alamofire

class HomeViewController: UICollectionViewController {
    
    var buttonsArray:           [String] = []
    
    var allCharactersArray:     [String] = []
    var studentCharacterArray:  [String] = []
    var staffCharacterArray:    [String] = []
    
    var gryffindorArray:        [String] = []
    var hufflepuffArray:        [String] = []
    var ravenclawArray:         [String] = []
    var slytherinArray:         [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Append button labels to buttonArray
        buttonsArray.append("All Characters")
        buttonsArray.append("Students")
        buttonsArray.append("Staff")
        buttonsArray.append("Gryffindor")
        buttonsArray.append("Hufflepuff")
        buttonsArray.append("Ravenclaw")
        buttonsArray.append("Slytherin")
        
        // fetch character data function calls
        fetchAllCharacterData()
        fetchStudentCharacterData()
        fetchStaffCharacterData()
        
        // Sets title on collectionView navigation bar
        title = "Harry Potter Movie Characters"
        
        // Adds padding around collectionView cells
        collectionView!.contentInset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)   
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonsArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else {
            fatalError("Unable to dequeue Character Cell")
        }
        
        let characterName = buttonsArray[indexPath.item]
        
        // sets cell characterLabel text
        cell.characterNameLabel.text    = characterName
        
        // Adds border and corner radius to collectionView cell
        cell.layer.borderColor          = UIColor.black.cgColor
        cell.layer.borderWidth          = 0.5
        cell.layer.cornerRadius         = 7
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let name = buttonsArray[indexPath.item]
        
        var array: [String]?
        var arrayName: String?
        
        // populates array with correct character data to send to details view controller
        // Defaults to all characters array
        switch name {
        case "All Characters":
            arrayName = "All Characters"
            array = allCharactersArray
        case "Students":
            arrayName = "Students"
            array = studentCharacterArray
        case "Staff":
            arrayName = "Staff"
            array = staffCharacterArray
        case "Gryffindor":
            arrayName = "Gryffindor"
            array = gryffindorArray
        case "Hufflepuff":
            arrayName = "Hufflepuff"
            array = hufflepuffArray
        case "Ravenclaw":
            arrayName = "Ravenclaw"
            array = ravenclawArray
        case "Slytherin":
            arrayName = "Slytherin"
            array = slytherinArray
        default:
            arrayName = "All Characters"
            array = allCharactersArray
        }
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "DetailsViewController", creator: { coder in
            return DetailsViewController (coder: coder, name: arrayName! ,array: array!)
        }) else {
            fatalError("DetailsViewController not found")
        }
        
        // present view controller full screen on navigation stack
        vc.modalPresentationStyle = .overFullScreen
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: JSON Data Call
extension HomeViewController {
    
    func fetchAllCharacterData() {
        
        // JSON Request
        let request = AF.request("https://hp-api.herokuapp.com/api/characters")
        
        // Fetch and Parse JSON Data
        request.responseDecodable(of: [Character].self) { (response) in
            
            // Stores response data in characters array
            guard let characters = response.value else { return }
            
            // Iterate through characters array, appending the name from decoded JSON Data
            // to the relevant array
            for character in characters {
                
                // Appends to all characters array
                self.allCharactersArray.append(character.name ?? "No Data Found")
                
                // Appends each character to the relevant array by house
                // some characters dont have a 'house' hence no else statement.
                if character.house == "Gryffindor" {
                    self.gryffindorArray.append(character.name ?? "No Data Found")
                } else if character.house == "Slytherin" {
                    self.slytherinArray.append(character.name ?? "No Data Found")
                } else if character.house == "Ravenclaw" {
                    self.ravenclawArray.append(character.name ?? "No Data Found")
                } else if character.house == "Hufflepuff" {
                    self.hufflepuffArray.append(character.name ?? "No Data Found")
                }
            }
        }
    }
    
    func fetchStudentCharacterData() {
        
        // JSON Request
        let request = AF.request("https://hp-api.herokuapp.com/api/characters/students")
        
        // Fetch and Parse JSON Data
        request.responseDecodable(of: [Character].self) { (response) in
            
            // Stores response data in characters array
            guard let characters = response.value else { return }
            
            // Iterate through characters array, appending the name from decoded JSON Data
            // to the student array
            for character in characters {
                self.studentCharacterArray.append(character.name ?? "No Data Found")
            }

        }
    }
    
    func fetchStaffCharacterData() {
        
        // JSON Request
        let request = AF.request("https://hp-api.herokuapp.com/api/characters/staff")
        
        // Fetch and Parse JSON Data
        request.responseDecodable(of: [Character].self) { (response) in
            
            // Stores response data in characters array
            guard let characters = response.value else { return }
            
            // Iterate through characters array, appending the name from decoded JSON Data
            // to the staff array
            for character in characters {
                self.staffCharacterArray.append(character.name ?? "No Data Found")
            }
        }
    }
}

