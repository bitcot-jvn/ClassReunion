//
//  GalleryDetailsVC.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 23/07/21.
//

import UIKit

class GalleryDetailsVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var page: UIPageControl!
    
    //MARK: Variables
    var data: GalleryModal?{
        didSet{
            DispatchQueue.main.async {
                
            }
        }
    }
    
    //MARK: Default function
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    fileprivate func configureUI() {
        if self.data?.imgEvent!.count ?? 0 > 1 {
            self.page.numberOfPages = self.data?.imgEvent!.count ?? 0
        }else{
            self.page.isHidden = true
        }
        
        self.navigationLargePreferStyle(false)
        self.showNavigationBar()
        self.navigationItem.title = self.data?.eventTitle
    }
    
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension GalleryDetailsVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data?.imgEvent!.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellGalleryDetails", for: indexPath) as! CellGalleryDetails
        cell.img.image = self.data?.imgEvent?[indexPath.row]
        cell.lblTitile.text = self.data?.eventTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.page.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

