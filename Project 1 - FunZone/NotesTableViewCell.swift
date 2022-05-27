//
//  NotesTableViewCell.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-26.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var notesTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
