//
//  CharacterDetailView.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
import UIKit

class CharacterDetailView: UIViewController {
    
    var chracter: Result?
    let requestHandler = RequestHandler()
    var arrayOfComics = [Comic]()
    
    
    init(_character: Result){
        self.chracter = _character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .white // not supporting dark mode currently
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        configureNavigationBar()
        getCharacterComics(id: (chracter?.id)!) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    //MARK: Setup TableView
    func setUpTableView(){
        self.view.addSubview(tableView)
        registerCells()
        tableView.delegate  = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.sectionHeaderTopPadding = 0
        
    }
    
    //MARK: - TableView Register Cells
    func registerCells(){
        tableView.register(CharacterHeaderTableViewCell.self, forCellReuseIdentifier: "CharacterHeader")
        tableView.register(CharacterDescriptionTableViewCell.self, forCellReuseIdentifier: "CharacterDescription")
        tableView.register(ComicsTableViewCell.self, forCellReuseIdentifier: "ComicTableViewCell")
    }
    
    //MARK: - Configure NavigationBar
    func configureNavigationBar(){
        
        let label = UILabel()
        label.text = "Character Information"
        label.textColor = .white
        label.font = UIFont(name: heroFontName, size: titleFontSize)
        //label.applyShadow(shadowColour: .black)
        
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .white
        let image = UIImageView(image: UIImage(named: "back")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .white
        backButton.setImage(image.image, for: .normal)
        backButton.addTarget(self, action: #selector(self.popViewController), for: .touchUpInside)
        
        let item1 = UIBarButtonItem(customView: backButton)
        
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = 10.0
        let item2 = UIBarButtonItem(customView: label)
        self.navigationItem.leftBarButtonItems = [item1, fixedSpace, item2]
    }
    
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - View for header
    func  setUpHeaderView(title: String, tableView: UITableView) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        headerView.backgroundColor = .red
        
        let titleForHeaderView = UILabel()
        headerView.addSubview(titleForHeaderView)
        titleForHeaderView.font = UIFont(name: heroFontName, size: 30)
        titleForHeaderView.text = title
        titleForHeaderView.textColor = .white
        titleForHeaderView.translatesAutoresizingMaskIntoConstraints = false
        titleForHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        titleForHeaderView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        titleForHeaderView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
}
