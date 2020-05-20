//
//  AddItemController.swift
//  HomeWork5
//
//  Created by Vadym Volkov on 19.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit


class AddItemController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var telephoneField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var groupField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    @IBAction func addItem(_ sender: Any) {
        let name = nameField.text ?? ""
        let surname = surnameField.text ?? ""
        let telephone = telephoneField.text ?? ""
        let city = cityField.text ?? ""
        let country = countryField.text ?? ""
        let group = groupField.text ?? ""
        
        
        if name != "" && surname != "" && telephone != "" && city != "" && country != "" && group != "" {
            let test = ["name": name, "surname": surname, "telephone": telephone, "city": city, "country": country, "group": group]
            let jsonHelper = JsonHelper("data")
            jsonHelper.saveData(test)
            navigationController?.popViewController(animated: true)
        }
    }

}
