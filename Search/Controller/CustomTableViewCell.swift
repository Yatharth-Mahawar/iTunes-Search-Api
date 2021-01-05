//
//  CustomTableViewCell.swift
//  Search
//
//  Created by Yatharth Mahawar on 1/4/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artworkImage: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        artworkImage.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
