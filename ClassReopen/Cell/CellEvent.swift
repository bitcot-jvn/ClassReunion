//
//  CellEvent.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 24/07/21.
//

import UIKit

class CellEvent: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventDiscription: UILabel!
    @IBOutlet weak var imgEvent: UIImageView!
    
    //MARK: variables
    var data: EventModal?{
        didSet{
            self.lblEventTitle.text = data?.eventTitle
            self.lblEventDiscription.text = data?.eventDiscription
            self.imgEvent.image = data?.imgEvent
        }
    }
    
    //MARK: Default function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
