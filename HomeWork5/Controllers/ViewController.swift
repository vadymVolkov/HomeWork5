//
//  ViewController.swift
//  HomeWork5
//
//  Created by Vadym Volkov on 19.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let jsonHelper = JsonHelper("data")
    var data: Array<[String: String]> = []
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        data = jsonHelper.getData()
        data.sort(by: {$0["name"]! < $1["name"]!})
    }
    override func viewWillAppear(_ animated: Bool) {
        data = jsonHelper.getData()
        data.sort(by: {$0["name"]! < $1["name"]!})
        tableView.reloadData()
    }
  
    @IBAction func addItem(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(identifier: "Add Item Controller")
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func editPressed(_ sender: Any) {
      tableView.isEditing.toggle()
    }

}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell
        cell = tableView.dequeueReusableCell(withIdentifier: "Custom Cell", for: indexPath) as! CustomCell
        //cell.textLabel?.text = data[indexPath.row]["name"] as? String
        cell.nameLabel.text = data[indexPath.row]["name"]
        cell.surnameLabel.text = data[indexPath.row]["surname"]
        cell.telephoneLabel.text = data[indexPath.row]["telephone"]
        cell.tag = indexPath.row
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                    didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(identifier: "Details Controller") as DetailsController
        navigationController?.pushViewController(vc, animated: true)
        vc.name = data[indexPath.row]["name"] ?? ""
        vc.surname = data[indexPath.row]["surname"] ?? ""
        vc.telephone = data[indexPath.row]["telephone"] ?? ""
        vc.city = data[indexPath.row]["city"] ?? ""
        vc.country = data[indexPath.row]["country"] ?? ""
        vc.group = data[indexPath.row]["group"] ?? ""
     }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            jsonHelper.removeDataByIndex(indexPath.row)
            data = jsonHelper.getData()
            data.sort(by: {$0["name"]! < $1["name"]!})
            tableView.reloadData()
        }
    
    }
    
}
