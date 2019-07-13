//
//  ViewController.swift
//  SwiftBasics
//
//  Created by Valeria Duran on 7/12/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let homeCellData = ["Contacts": ["Sam", "Mom", "Dad"],
                        "Feelings": ["Sad", "Lonely"]]
    
    struct Objects {
        var sectionName: String!
        var sectionObjects: [String]!
    }
    var objectArray = [Objects]()
    
    var homeKeys = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Friendly"
        homeKeys = Array(homeCellData.keys).sorted(by: <)
        for (key, value) in homeCellData {
            print("\(key) -> \(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
}

