//
//  CellSideMenu.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 22/07/21.
//

import UIKit

class CellSideMenu: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
