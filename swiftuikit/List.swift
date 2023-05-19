//
//  List.swift
//  swiftuikit
//
//  Created by deebika-pt6680 on 02/05/23.
//

import UIKit

class List: UIViewController {

    var topics: [String] = ["navigation controller","UIButtons","UIViews","UIElements","TableViewController","TableView","AutoLayout Login Form","Collection View Controller","Compositonal Layout","Scroll View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    
    }
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    func setUpTableView() {
        
        view.addSubview(tableView)
        let header = UIView()
        let footer = UIView()
    
        header.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "listView")
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension List: UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listView", for: indexPath) as! CustomTableViewCell
        cell.button.setTitle(topics[indexPath.row], for: .normal)
        cell.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonTapped(button: UIButton) {
        if let cell = button.superview?.superview as? CustomTableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
                    switch indexPath.row {
                    case 0:
                        button.addTarget(self, action: #selector(navToNextScreen), for: .touchUpInside)
                    case 1:
                        button.addTarget(self, action: #selector(navigateToUIButtons), for: .touchUpInside)
                    case 2:
                        button.addTarget(self, action: #selector(navigateToUIViews), for: .touchUpInside)
                    case 3:
                        button.addTarget(self, action: #selector(navigateToUIElements), for: .touchUpInside)
                    case 4:
                        button.addTarget(self, action: #selector(navigateToTableVC), for: .touchUpInside)
                    case 5:
                        button.addTarget(self, action: #selector(navigateToTableV), for: .touchUpInside)
                    case 6:
                        button.addTarget(self, action: #selector(navigateToLoginForm), for: .touchUpInside)
                    case 7:
                        button.addTarget(self, action: #selector(navToCollectionVC), for: .touchUpInside)
                    case 8:
                        button.addTarget(self, action: #selector(navigateToCompostionalV), for: .touchUpInside)
                    case 9:
                        button.addTarget(self, action: #selector(navigateToScrollV), for: .touchUpInside)
                    default:
                        print("")
                    }
        }
    }
    
    @objc func navigateToScrollV() {
        navigationController?.pushViewController(ScrollView(), animated: true)
    }
    
    @objc func navToNextScreen() {
        let nextScreen = navigation()
//        nextScreen.title = "Second Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func navigateToUIElements() {
        navigationController?.pushViewController(UIElements(), animated: true)
    }
    
    @objc func navigateToUIButtons() {
        navigationController?.pushViewController(UIButtons(), animated: true)
    }
    
    @objc func navigateToUIViews() {
        navigationController?.pushViewController(UIViews(), animated: true)
    }
    
    @objc func navigateToLoginForm() {
        navigationController?.pushViewController(SimpleLogin(), animated: true)
    }
    
    @objc func navigateToCompostionalV() {
        navigationController?.pushViewController(CompositonalLayout(), animated: true)
    }
    
    @objc func navigateToTableV() {
        navigationController?.pushViewController(TableVC(), animated: true)
    }
    
    @objc func navToCollectionVC() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
        layout.minimumLineSpacing = 5 // space b/w cell (vertical)
        layout.minimumInteritemSpacing = 1 // space b/w cell (horizontal)
        // space b/w the frame and items
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        //CollectionVC
        let collectionVC = CollectionViewController(collectionViewLayout: layout)
        collectionVC.title = "Grid View Controller"
        collectionVC.navigationItem.largeTitleDisplayMode = .always
//        collectionVC.navigationItem.titleView?.tintColor = .white
        //navVC
        //let navVC = UINavigationController(rootViewController: collectionVC)
//        navVC.navigationBar.prefersLargeTitles = true
        //Presenting View Controller
        //present(navVC, animated: true)
        self.navigationController?.pushViewController(collectionVC, animated: true)
    }
    
    @objc func navigateToTableVC() {
        navigationController?.pushViewController(tableViewController(), animated: true)
    }
    
}
protocol CustomCellDelegate {
    func buttonTapped( button: UIButton)
}

class CustomTableViewCell: UITableViewCell {
    
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.setTitleColor(.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








