//
//  SearchManager.swift
//  Search
//
//  Created by Yatharth Mahawar on 1/5/21.
//

import UIKit
import SwiftyJSON


protocol SearchManagerDelegate {
    func didUpdateData(data:JSON)
}

struct SearchManager {
    
    var delegate:SearchManagerDelegate?
    
    func getData(searchName:String){
        let search = searchName.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "https://itunes.apple.com/search?term=\(search)&entity=song&limit=50")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do {
                let jsonData = try JSON(data: data)
                let results = jsonData["results"]
                self.delegate?.didUpdateData(data: results)
                            
            }
            catch {
                print(error)
            }
        }.resume()
        
    }
}

