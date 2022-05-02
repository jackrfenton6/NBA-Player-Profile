//
//  ViewController.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/1/22.
//

import UIKit

class ProfileListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    var profiles = Profiles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        configureSegmentedControl()
        eliminateNil()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserInterface()
        self.sortBasedOnSegmentPressed()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! ProfileDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.profileData = profiles.profileArray[selectedIndexPath.row]
        }
    }
    
    func configureSegmentedControl() {
        sortSegmentedControl.layer.borderColor = UIColor.white.cgColor
        sortSegmentedControl.layer.borderWidth = 1.0
    }
    
    func updateUserInterface() {
        profiles.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        eliminateNil()
    }
    
    func eliminateNil() {
        var count = 0
        for prof in profiles.profileArray {
            if prof.BirthCity == nil {
                profiles.profileArray[count].BirthCity = "N/A"
            }
            if prof.BirthState == nil {
                profiles.profileArray[count].BirthState = "N/A"
            }
            if prof.BirthCountry == nil {
                profiles.profileArray[count].BirthCountry = "N/A"
            }
            if prof.Salary == nil {
                profiles.profileArray[count].Salary = 0
            }
            count += 1
        }
    }
    
    func sortBasedOnSegmentPressed() {
        switch sortSegmentedControl.selectedSegmentIndex {
        case 0: //A-Z
            profiles.profileArray.sort(by: {$0.FanDuelName < $1.FanDuelName})
        case 1: //salary
            profiles.profileArray.sort(by: {$0.Salary ?? 0 > $1.Salary ?? 0})
        default:
            print("Hey you shouldnt have gotten here")
        }
        tableView.reloadData()
    }
    
    @IBAction func sortSegmentPressed(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
}


extension ProfileListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.profileArray.count
    }
    func formatNumber() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        var profileData: [ProfileInfo] = []
        for i in 0...profiles.profileArray.count {
            let salary = numberFormatter.string(from: NSNumber(value: profiles.profileArray[i].Salary ?? 0))
            profileData.append(salary)
        }
        
        }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(profiles.profileArray[indexPath.row].FanDuelName)"
        cell.detailTextLabel?.text = "$\(profiles.profileArray[indexPath.row].Salary ?? 0)"
        return cell
    }
    
    
}

