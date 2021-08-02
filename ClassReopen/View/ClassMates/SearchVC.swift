//
//  SearchVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 24/07/21.
//

import UIKit

class SearchVC: UIViewController {
    typealias handler = (_ data:classMateModal, _ isFavourite: Bool) -> Void
    
   //MARK: Outlets
    @IBOutlet weak var colClassMates: UICollectionView!

    //MARK: Variables
    var complitionHandler: handler?
    
    var arrFilterData: [classMateModal] = []{
        didSet{
            if oldValue != arrFilterData{
                self.colClassMates.reloadData()
            }
        }willSet(new){
            self.arrFilterData = new
        }
    }
    
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFilterData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellClassMates", for: indexPath) as! CellClassMates
        
        cell.data = self.arrFilterData[indexPath.row]
      
        cell.FavouriteAction = { [self] in // action of favourite button click
           
                cell.btnFavourite.isSelected.toggle()
                if cell.btnFavourite.isSelected{
                    self.arrFilterData[indexPath.row].favourite = true
                }else{
                    self.arrFilterData[indexPath.row].favourite = false
                }
            
            complitionHandler!(self.arrFilterData[indexPath.row], true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 230.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.complitionHandler!(self.arrFilterData[indexPath.row], false)
    }
}
