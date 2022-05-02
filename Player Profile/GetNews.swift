//
//  GetNews.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/2/22.
//

import Foundation

class GetNews {
    var newsArray: [News] = []
    var url = "https://api.sportsdata.io/v3/nba/scores/json/News?key=c084979e0acd447cb2ceb1f7fef4b9aa"
    
    func getData(completed: @escaping () -> ()) {
        let urlString = url
        
        print("We are accessing the url: \(urlString)")
        
        //Create a URL
        guard let url = URL(string: urlString) else {
            print("Error could not get a URL from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            do {
                self.newsArray = try JSONDecoder().decode([News].self, from: data!)
                print(self.newsArray)
            } catch {
                print("JSON Error: \(error)")
            }
            completed()
        }
        task.resume()
    }

}
