//
//  DetailsController.swift
//  HomeWork5
//
//  Created by Vadym Volkov on 19.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    
    var name: String?
    var surname: String?
    var telephone: String?
    var city: String?
    var country: String?
    var group: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        surnameLabel.text = surname
        telephoneLabel.text = telephone
        cityLabel.text = city! + ","
        countryLabel.text = country
        groupLabel.text = group
    }
    


}
