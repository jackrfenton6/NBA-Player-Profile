//
//  ProfileDetailViewController.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/1/22.
//

import UIKit
//import SDWebImage

class ProfileDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var collegeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var profileData: ProfileInfo!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heightFeet = Int(Float(profileData.Height/12).rounded())
        let heightInches = Int(profileData.Height) - Int(heightFeet*12)
        let height = "\(heightFeet)'\(heightInches)"
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let salary = numberFormatter.string(from: NSNumber(value: profileData.Salary ?? 0))
        
        nameLabel.text = profileData.FanDuelName
        salaryLabel.text = "$\(salary ?? "0")"
        experienceLabel.text = "\(profileData.Experience ?? 0)"
        positionLabel.text = profileData.Position
        weightLabel.text = "\(profileData.Weight)"
        countryLabel.text = profileData.BirthCountry ?? ""
        stateLabel.text = profileData.BirthState ?? ""
        cityLabel.text = "\(profileData.BirthCity ?? ""),"
        teamLabel.text = profileData.Team
        heightLabel.text = "\(height)"
        collegeLabel.text = "\(profileData.College)"
        
        
//        let stateString = stateAbbreviations[stateData.state] ?? ""

        guard let url = URL(string: profileData.PhotoUrl) else {return}
        do {
            let data = try Data(contentsOf: url)
            self.profileImageView.image = UIImage(data: data)
        } catch {
            print("Error: error thrown to get image from url: \(url)")
        }
        

    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {

    }

}
