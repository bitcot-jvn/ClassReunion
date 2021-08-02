//
//  CellRSVP.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 24/07/21.
//

import UIKit

class CellRSVP: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var lblResponse: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblResponseTitle: UILabel!
    
    //MARK: Variables
    
    var data: RsvpModal?{
        didSet{
            self.lblResponse.text = data?.rsponse
            self.lblEmail.text = data?.email
            self.lblResponseTitle.text = data?.rsponse
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
