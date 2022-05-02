//
//  NewsViewController.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/2/22.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    
    var news = GetNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        news.getData {
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
        
        newsTableView.dataSource = self
        newsTableView.delegate = self

    }
    
    func leaveViewController() {
        let isPresentingInAddModule = presentingViewController is UINavigationController
        if isPresentingInAddModule {dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsDetail" {
            let destination = segue.destination as! NewsDetailViewController
            let selectedIndexPath = newsTableView.indexPathForSelectedRow!
            destination.newsData = news.newsArray[selectedIndexPath.row]
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        cell.textLabel?.text = "\(news.newsArray[indexPath.row].Title)"
        return cell
    }
    
    
}
