//
//  MonsterTableViewCell.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 25/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class MonsterTableViewCell: UITableViewCell
{
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: ...
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
