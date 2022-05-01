//
//  ViewController.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/1/22.
//

import UIKit

class ProfileListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var profiles = Profiles()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        profiles.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ProfileListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = profiles.profileArray[indexPath.row].FanDuelName
        return cell
    }
    
    
}

