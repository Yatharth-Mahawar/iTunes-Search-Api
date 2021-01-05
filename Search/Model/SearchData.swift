//
//  SearchData.swift
//  Search
//
//  Created by Yatharth Mahawar on 1/4/21.
//

import Foundation
import SwiftyJSON

struct Artist {
    var artistName:String = ""
    var trackName:String = ""
    var artwork:String = ""
    
    init() {
        
    }
    
    init(json:JSON) {
        self.artistName  = json["artistName"].stringValue
        self.trackName = json["trackName"].stringValue
        self.artwork = json["artworkUrl60"].stringValue
        
    }

}

