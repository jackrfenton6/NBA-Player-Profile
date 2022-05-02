//
//  NewsDetailViewController.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/2/22.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
   
    var newsData: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = newsData.Title
        dateLabel.text = newsData.TimeAgo
        contentLabel.text = newsData.Content
        sourceLabel.text = newsData.OriginalSource
    }
    
    func leaveViewController() {
        let isPresentingInAddModule = presentingViewController is UINavigationController
        if isPresentingInAddModule {dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
}
