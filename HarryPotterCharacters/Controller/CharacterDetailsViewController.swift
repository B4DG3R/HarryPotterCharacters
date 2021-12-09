//
//  CharacterDetailsViewController.swift
//  HarryPotterCharacters
//
//  Created by Matthew Hollyhead on 07/11/2021.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    var name: String?
    var gender: String?
    var dateOfBirth: String?
    var schoolHouse: String?
    var patronus: String?
    var actor: String?
    
    init?(coder: NSCoder, nameData: String, genderData: String, dateOfBirthData: String, houseData: String, patronusData: String, actorData: String) {
        
        self.name = nameData
        self.gender = genderData
        self.dateOfBirth = dateOfBirthData
        self.schoolHouse = houseData
        self.patronus = patronusData
        self.actor = actorData
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code) did not run")
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = name
        
        nameLabel.text = "Character name: \(name ?? "No Data Found")"
        genderLabel.text = "Gender: \(gender ?? "No Data Found")"
        dateOfBirthLabel.text = "Date of birth: \(dateOfBirth ?? "No Data Found")"
        houseLabel.text = "School House: \(schoolHouse ?? "No Data Found")"
        patronusLabel.text = "Patronus: \(patronus ?? "No Data Found")"
        actorLabel.text = "Actor: \(actor ?? "No Data Found")"
        
        let favorites = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favoriteStudent))
        navigationItem.rightBarButtonItem = favorites
        
    }
}

extension CharacterDetailsViewController {
    
    @objc func favoriteStudent() {
        
    }
}
