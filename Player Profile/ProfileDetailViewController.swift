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
    
    var profiles = Profiles()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameLabel.text =
        print(profiles.profileArray)
        
        profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
//        guard let url = URL(string: profiles.profileArray.PhotoUrl) else {
//            profileImageView.image = UIImage(systemName: "nba-logo")
//            return
//        }
//        profileImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "nba-logo"))
//
//    }
//    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
//
//    }
//
    }
}
