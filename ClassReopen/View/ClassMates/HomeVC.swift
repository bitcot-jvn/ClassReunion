//
//  ViewController.swift
//  ClassReopen
//
//  Created by BitCot Technologies on 20/07/21.
//

import UIKit

class HomeVC: BaseViewController, UISearchBarDelegate {

    //MARK: Outlets
    @IBOutlet weak var colList: UICollectionView!
    
    //MARK: Variables
    var arrData = [classMateModal](){
        didSet{
            DispatchQueue.main.async {
                self.colList.reloadData()
            }
        }
    }
    var arrTemp = [classMateModal]()
    var arrFilter = [classMateModal]()
    var sortDefault: String?
    var isSelectedAll = true
    var search: UISearchController! = nil
    var resultsTableViewController: SearchVC!
    var searchTextFild = UITextField()
    
    //MARK: default function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortDefault = sortBy.Defaultdown.getOption()
        self.setUpSearch()
        self.arrData = DataHelper.shared.setdata
        self.arrTemp = DataHelper.shared.setdata
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.6156862745, blue: 0.2823529412, alpha: 1)
        self.configureUI()
    }
    
    
    //MARK: Function
    fileprivate func configureUI() {
        self.setupSideMenu()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.title = "Classmates"
        self.navigationLargePreferStyle(true)
        self.showNavigationBar()
        self.setRightAndLeftBarButton(leftButton: true, rightButton: true)
        let right = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .done, target: self, action: #selector(rightBarAction))
        self.navigationItem.rightBarButtonItem = right
        
        
    }
    
    @objc func rightBarAction(){
        let vc = MainClass.main.instantiateViewController(withIdentifier: ViewControllers.SortVC.getController()) as! SortVC
        vc.delegate = self
        vc.selectedActionIs = self.sortDefault
        self.present(vc, animated: true)
    }
    
func setUpSearch(){
    resultsTableViewController = MainClass.Home.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
    self.search = UISearchController(searchResultsController: resultsTableViewController )
    searchTextFild = (self.search.searchBar.value(forKey: "searchField") as? UITextField)!
    search.searchBar.delegate = self
    search.searchBar.placeholder = "Search"
    search.searchBar.showsScopeBar = true
    self.search.searchBar.sizeToFit()
    searchTextFild.returnKeyType = .done
    search.searchBar.scopeButtonTitles = ["ALL", "FAVOURITES"]
    definesPresentationContext = true
    search.searchBar.setScopeBarButtonTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white ], for: UIControl.State.normal)
    search.searchBar.setScopeBarButtonTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 211/255.0, green: 157/255.0, blue: 72/255.0, alpha: 1.0) ], for: .selected)
    search.obscuresBackgroundDuringPresentation = true
    search.hidesNavigationBarDuringPresentation = true
    search.searchBar.setMagnifyingGlassColorTo(color: .white)
    self.navigationItem.searchController = search
    search.searchResultsUpdater = self
    self.navigationItem.hidesSearchBarWhenScrolling = false
}
    
}

//MARK: Delegates
extension HomeVC: SelectReason, UIScrollViewDelegate, UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard  let text = searchController.searchBar.text else {
            return
        }
        searchController.searchBar.searchTextField.textColor = .white
        //
       let vc =  searchController.searchResultsController as? SearchVC
        vc?.arrFilterData = arrTemp.filter({(value) -> Bool in
            return value.name!.range(of: text, options: .caseInsensitive) != nil
        })
        
        //Clouser for redirection from serchcontorller , update favourite list
        vc?.complitionHandler = { (filterData, isfavourite) in
            if isfavourite{
                //remove and add newdata from search controller for favourites
                if let index = self.arrData.firstIndex(where: { $0.id == filterData.id }) {
                    self.arrData.remove(at: index)
                    self.arrData.insert(filterData, at: index)
                    self.arrTemp = self.arrData
                }
            }else{//redirection from SearchViewController
                let vc = MainClass.Classmates.instantiateViewController(withIdentifier: ViewControllers.ClassMateDetailVC.getController()) as! ClassMateDetailVC
                vc.data = filterData
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        search.searchBar.showsScopeBar = false
        self.search.searchBar.sizeToFit()
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if !search.isActive || self.searchTextFild.text == "" {
            search.searchBar.showsScopeBar = true
            self.search.searchBar.sizeToFit()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search.searchBar.showsScopeBar = true
        self.search.searchBar.sizeToFit()
    }
    
    //ScopBar action here
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0{
            if !self.search.isActive{
                self.arrData = arrTemp
            }else{
                self.arrData = self.arrFilter
            }
            isSelectedAll = true
        }else{
            isSelectedAll = false
            self.arrData = arrData.filter({ allData in
                if allData.favourite == true{
                    return true
                }else{
                    return false
                }
            })
        }
    }
    
    //Sorting
    func reasonIs(_ name: String) {
        if sortDefault != name{
            if sortBy.DefaultUp.getOption() == name{
                self.arrData.reverse()
            }else if sortBy.Defaultdown.getOption() == name{
                self.arrData.reverse()
            }else if sortBy.AtoZ.getOption() == name{
                self.arrData =  arrData.sorted { $0.name!.lowercased() < $1.name!.lowercased() }
            }else if sortBy.ZtoA.getOption() == name{
                self.arrData =  arrData.sorted { $0.name!.lowercased() > $1.name!.lowercased() }
            }
            self.sortDefault = name
        }
    }
    
    
}

