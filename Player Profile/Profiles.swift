//
//  Profile.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/1/22.
//

import Foundation

class Profiles {
    
    var profileArray: [ProfileInfo] = []
    var url = "https://api.sportsdata.io/v3/nba/scores/json/Players?key=c084979e0acd447cb2ceb1f7fef4b9aa"
    
    func getData(completed: @escaping () -> ()) {
        let urlString = url
        
        print("We are accessing the url \(urlString)")
        
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
                self.profileArray = try JSONDecoder().decode([ProfileInfo].self, from: data!)

            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
