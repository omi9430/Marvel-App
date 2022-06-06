//
//  ChractersView.swift
//  Marvel-App
//
//  Created by omair khan on 01/06/2022.
//

import Foundation
import UIKit
import SDWebImage

class HomeChractersView: UIViewController {
    
    
    private let activityIndicator = LoadingIndicator()
    let networkApi = RequestHandler()
    var isSeaarching = false
    var chractersData = [Result]()
    var searchedData  = [Result]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    let collectionView: UICollectionView = {
        /// Create custom collectionView FlowLayOut
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width/2) - 10, height: UIScreen.main.bounds.size.width)
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        
       
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(HomeChractersCell.self, forCellWithReuseIdentifier: "Characters")
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpCollectionView()
        configureNavigationBar()
        fetchData()
        setUpSearchBar()
        showLoading()
    }
    
    override func viewDidLayoutSubviews() {
        // set collectionView Frame
        collectionView.frame = self.view.bounds
    }
    
    //MARK: - Loadding Indicator
    func showLoading(){
        activityIndicator.displayLoader(view: self.view)
        activityIndicator.startAnimating()
    }
    
    //MARK: - SetUp SearchBar
    private func setUpSearchBar(){
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false // will  prevent background to be dim while searching
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done  // change return key from search to done
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = false
        searchController.searchBar.placeholder = "Search Character By Name"
        searchController.searchBar.isUserInteractionEnabled  = false
    }
    
    //MARK: - Setup CollectionView
    private func setUpCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - Configure NavBar
    func configureNavigationBar(){
        self.navigationController?.navigationBar.barStyle = .black
        let navBar = self.navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = false
        navBar?.barTintColor = .red
        
        let leftTitle = UILabel()
        leftTitle.font = UIFont(name: heroFontName, size: titleFontSize)
        leftTitle.text = "Comic Characters"
        leftTitle.textColor = .white // we can add some custom colours later
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftTitle)
    }
    
    //MARK: - Fetch Data
    func fetchData() {
        /// This function will  fetch the array of data and  reload collectionView
    getHomeData {
            
            DispatchQueue.main.async { [weak self] in
                /// Stop loading indicator and reload collectionView
                self?.activityIndicator.stopAnimating()
                self?.searchController.searchBar.isUserInteractionEnabled  = true
                self?.collectionView.reloadData()
            }
        }
    }
}
