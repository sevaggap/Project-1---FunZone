//
//  MusicTableViewCell.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-26.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
