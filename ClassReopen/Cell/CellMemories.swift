//
//  CellMemories.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 24/07/21.
//

import UIKit

class CellMemories: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var data: classMateModal?{
        didSet{
            self.lblDate.text = data?.MemorieDate
            self.lblTitle.text = data?.MemorieTitle
            self.lblDiscription.text = data?.MemorieDiscription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
