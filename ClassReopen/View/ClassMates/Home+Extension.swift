//
//  Home+Extension.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 24/07/21.
//

import Foundation
import UIKit

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellClassMates", for: indexPath) as! CellClassMates
        cell.data = self.arrData[indexPath.row]
        
        cell.FavouriteAction = { [self] in // action of favourite button click
            cell.btnFavourite.isSelected.toggle()
            if cell.btnFavourite.isSelected{
                self.arrData[indexPath.row].favourite = true
                let index = arrTemp.firstIndex { data in
                    return data.id == arrData[indexPath.row].id
                }
                self.arrTemp[index!].favourite = true
            }else{
                self.arrData[indexPath.row].favourite = false
                let index = arrTemp.firstIndex { data in
                    return data.id == arrData[indexPath.row].id
                }
                
                if !isSelectedAll{
                    arrData.remove(at: indexPath.row)
                }
                self.arrTemp[index!].favourite = false
             
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 230.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MainClass.Classmates.instantiateViewController(withIdentifier: ViewControllers.ClassMateDetailVC.getController()) as! ClassMateDetailVC
        vc.data = self.arrTemp[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
