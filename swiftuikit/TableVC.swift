//
//  TableVC.swift
//  UIElements
//
//  Created by deebika-pt6680 on 25/04/23.
//

import UIKit

class TableVC: UIViewController {
    
    var numbers: [[String]] = [
        ["168","2534","38796","45635","508","6089","7314"],
        ["1","2","3","4","5","6"],
        ["1","2","3","4","5"],
        ["1","2","3","4"]
    ]
    
    var searchedArray: [String] = []
    
    private lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Enter search text"
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureNavBarItem()
        setupSearchBar()
        //tableView.reloadData()
    }
    
    func setupSearchBar() {
        
        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
//        view.addSubview(searchBar)
//        NSLayoutConstraint.activate([
//            searchBar.heightAnchor.constraint(equalToConstant: 20),
//            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor),
//            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
//        ])
    }
    
    //Instantiating table view object
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        header.backgroundColor = .lightGray
        footer.backgroundColor = .lightGray
        tableView.tableFooterView = footer
        tableView.tableHeaderView = header
        return tableView
    }()

    func configureNavBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavBarButton))
    }
    
    @objc func editNavBarButton() {
        if tableView.isEditing {
            tableView.isEditing = false
        }
        else {
            tableView .isEditing = true
        }
    }
}

// MARK: Table View Setup
extension TableVC {

    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
}
// MARK: Search Bar functions
// MARK: Table View delegate and datasource
extension TableVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return sourceIndexPath.section == proposedDestinationIndexPath.section ? proposedDestinationIndexPath : sourceIndexPath
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section != destinationIndexPath.section {
            print("blah")
            return
        }
//        print(sourceIndexPath.section.self) //section index
//        print(sourceIndexPath.row) // value index
        numbers[sourceIndexPath.section.self].remove(at: sourceIndexPath.row)
        numbers[sourceIndexPath.section.self].insert(String(sourceIndexPath.item), at: destinationIndexPath.row)
        return numbers[sourceIndexPath.section].swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    // default button style to edit
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    //remove indentation at the cell
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
         return numbers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers[section].count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "section \(section + 1)"
//    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.contentView.subviews.forEach {
//
//        }
//
//    }
    
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "changed"
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        sectionHeaderView.backgroundColor = .lightGray
        let sectionHeaderLabel = UILabel()
        let customButton = UIButton()
        customButton.frame = CGRect(x: 10, y: 0, width: 20, height: 20)
        customButton.setImage(.add, for: .normal)
        customButton.tintColor = .label
        //let customButtonWrapper = UIBarButtonItem(customView: customButton)
        sectionHeaderView.addSubview(customButton)
        sectionHeaderLabel.frame = CGRect(x: 100, y: 0, width: 100, height: 20)
        sectionHeaderLabel.text = "Section \(section)"
        sectionHeaderLabel.textColor = .systemPink
        sectionHeaderView.addSubview(sectionHeaderLabel)
        return sectionHeaderView
    }
    
    
    @objc func doneButtonTapped() {
        
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 10
//    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return UIView()
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        cell.textLabel?.text = numbers[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = .systemPink
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(numbers[indexPath.section][indexPath.row])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedArray = []
        if searchText != "" {
            searchedArray = numbers[0].filter({ value in
                value.contains(searchText)
            })
            numbers = [searchedArray]
        }
        else {
            searchedArray = numbers[0]
        }
        tableView.reloadData()
    }

}
