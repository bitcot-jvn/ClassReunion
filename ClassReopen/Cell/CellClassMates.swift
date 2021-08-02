//
//  CellClassMates.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import UIKit

class CellClassMates: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnFavourite: UIButton!
    
    //MARK: variables
    var data = classMateModal(){
        didSet{
            self.lblName.text = data.name
            self.lblId.text = data.id
            self.imgProfile.image = data.profileImage
            if data.favourite == true{
                self.btnFavourite.isSelected = true
            }else{
                self.btnFavourite.isSelected = false
            }
            
        }
    }
    
    var FavouriteAction: (() -> Void)? = nil
    
    @IBAction func btnFavouriteAction(_ sender: UIButton){
        FavouriteAction!()
    }
    
}
