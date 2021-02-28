//
//  RepositoryDetailsVC.swift
//  TherapBdCodingTest
//
//  Created by Mohammad Ashraful Islam Sadi on 28/2/21.
//

import UIKit

class RepositoryDetailsVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var repoTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Repository Details"
       
    }
}

extension RepositoryDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "RepoLanguageCell", for: indexPath) as! RepoLanguageCell
            cell.textLabel?.text = "Language: Swift"
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "RepoStarCell", for: indexPath) as! RepoStarCell
            cell.textLabel?.text = "Star: 20341"
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "RepoLicenseCell", for: indexPath) as! RepoLicenseCell
            cell.textLabel?.text = "License: MIT License"
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "RepoDescriptionCell", for: indexPath) as! RepoDescriptionCell
            cell.textLabel?.text = "Description: The better way to deal with JSON data in Swift"
        default:
            print("No Cell found")
        }
        
        return cell
    }
    
    
}

extension RepositoryDetailsVC: UITableViewDelegate {
    
}
