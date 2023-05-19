//
//  BasicElementsVCViewController.swift
//  UIElements
//
//  Created by deebika-pt6680 on 24/04/23.
//

import UIKit

class UIElements: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    let items = ["Item 1", "Item 2", "Item 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabelConfiguration()
        // Set the switch's frame and add it to the view
        view.addSubview(mySwitch)
        view.addSubview(segmentedControl)
        view.addSubview(slider)
        //view.addSubview(textView)
        view.addSubview(toolbar)
        view.addSubview(alertButton)
        alertButton.addTarget(self, action: #selector(displayAlert), for: .touchUpInside)
        picker.delegate = self
        picker.dataSource = self
        view.addSubview(picker)
        mySwitch.addTarget(self, action: #selector(switchStateChanged), for: .valueChanged)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        //        setupIntrinsicView()
        //setuptableButton()
    }
    //deprecated
    //    override var prefersStatusBarHidden: Bool {
    //        return true
    //    }
    
    func setupLabelConfiguration() {
        view.addSubview(grayView)
        grayView.addSubview(image)
        grayView.addSubview(label)
        NSLayoutConstraint.activate([
            grayView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            grayView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            grayView.widthAnchor.constraint(equalToConstant: 300),
            grayView.heightAnchor.constraint(equalToConstant: 50),
            
            image.centerXAnchor.constraint(equalTo: grayView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 44),
            image.widthAnchor.constraint(equalToConstant: 44),
            image.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            
            label.centerXAnchor.constraint(equalTo: grayView.centerXAnchor, constant: 80),
            label.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 2),
            label.widthAnchor.constraint(lessThanOrEqualTo: grayView.widthAnchor, constant: 15),
            label.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
//    func setuptableButton() {
//        view.addSubview(tableVCButton)
//        view.addSubview(tableButton)
//        view.addSubview(collectionViewButton)
//        view.addSubview(compositionalViewButton)
//        collectionViewButton.addTarget(self, action: #selector(navToCollectionVC), for: .touchUpInside)
//        tableVCButton.addTarget(self, action: #selector(navigateToTableVC), for: .touchUpInside)
//        tableButton.addTarget(self, action: #selector(navigateToTableV), for: .touchUpInside)
//        compositionalViewButton.addTarget(self, action: #selector(navigateToCompostionalV), for: .touchUpInside)
//    }
    
//    @objc func navigateToCollectionV() {
//        navigationController?.pushViewController(ViewController(), animated: true)
//    }
    
    
//    @objc func navigateToCompostionalV() {
//        navigationController?.pushViewController(CompositonalLayout(), animated: true)
//    }
//
//    @objc func navigateToTableV() {
//        navigationController?.pushViewController(TableVC(), animated: true)
//    }
//
//    @objc func navToCollectionVC() {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
//        layout.minimumLineSpacing = 5 // space b/w cell (vertical)
//        layout.minimumInteritemSpacing = 1 // space b/w cell (horizontal)
//        // space b/w the frame and items
//        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//        //CollectionVC
//        let collectionVC = CollectionViewController(collectionViewLayout: layout)
//        collectionVC.title = "Grid View Controller"
//        collectionVC.navigationItem.largeTitleDisplayMode = .always
////        collectionVC.navigationItem.titleView?.tintColor = .white
//        //navVC
//        //let navVC = UINavigationController(rootViewController: collectionVC)
////        navVC.navigationBar.prefersLargeTitles = true
//        //Presenting View Controller
//        //present(navVC, animated: true)
//        self.navigationController?.pushViewController(collectionVC, animated: true)
//    }
//
//    @objc func navigateToTableVC() {
//        navigationController?.pushViewController(tableViewController(), animated: true)
//    }
    
//    private let collectionViewButton: UIButton = {
//        let collectionViewButton = UIButton()
//        collectionViewButton.setTitle("CollectionView", for: .normal)
//        collectionViewButton.frame = CGRect(x: 100, y: 710, width: 200, height: 40)
//        collectionViewButton.backgroundColor = .blue
//        return collectionViewButton
//    }()
//
//    private let compositionalViewButton: UIButton = {
//        let collectionViewButton = UIButton()
//        collectionViewButton.setTitle("Compositional View", for: .normal)
//        collectionViewButton.frame = CGRect(x: 100, y: 780, width: 200, height: 40)
//        collectionViewButton.backgroundColor = .blue
//        return collectionViewButton
//    }()
    
//    private let tableButton: UIButton = {
//        let tableButton = UIButton()
//        tableButton.setTitle("tableView", for: .normal)
//        tableButton.frame = CGRect(x: 100, y: 650, width: 200, height: 40)
//        tableButton.backgroundColor = .blue
//        return tableButton
//    }()
//
//    private let tableVCButton: UIButton = {
//        let tableVCButton = UIButton()
//        tableVCButton.setTitle("tableVc", for: .normal)
//        tableVCButton.frame = CGRect(x: 100, y: 580, width: 200, height: 40)
//        tableVCButton.backgroundColor = .blue
//        return tableVCButton
//    }()
    
    private func setupIntrinsicView() {
        let intrinsicView = UIView()
        view.addSubview(intrinsicView)
        intrinsicView.backgroundColor = .gray
        intrinsicView.frame = CGRect(x: 9, y: 500, width: 20, height: 20)
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        intrinsicView.addSubview(text)
        text.text = "hiiiiiiiii"
        text.textColor = .blue
        text.sizeToFit() //intrinsic content view size
    }
    
    private let grayView: UIView = {
        let grayView = UIView()
        grayView.backgroundColor = .gray
        grayView.translatesAutoresizingMaskIntoConstraints = false
        return grayView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "hi"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "test")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    @objc func displayAlert() {
        let alert = UIAlertController(title: "Alert", message: "this is a test alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default,handler: nil))
        present(alert, animated: true,completion: {
            return
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 30, y: 300, width: 300, height: 150)
        return picker
    }()
    
    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 20, y: 200, width: 200, height: 50)
        let archive = UIBarButtonItem(image: UIImage(systemName: "archivebox"), style: .plain, target: nil, action: nil)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace/*.fixedSpace*/, target: nil, action: nil)
        let add = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: nil, action: nil)
        //toolbar.translatesAutoresizingMaskIntoConstraints = true
        toolbar.setItems([archive, spacer, add], animated: false)
        return toolbar
    }()
    
    
    
    private let alertButton : UIButton = {
        let alertButton = UIButton()
        alertButton.frame = CGRect(x: 20, y: 250, width: 100, height: 44)
        alertButton.backgroundColor = .blue
        alertButton.configuration = .filled()
        alertButton.setTitle("alert", for: .normal)
        return alertButton
    }()
    
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.gray
        return textView
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.frame = CGRect(x: 50, y: 100, width: 0, height: 0)
        return mySwitch
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Option 1", "Option 2", "Option 3"])
        segmentedControl.frame = CGRect(x: 10, y: 150, width: 300, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private let slider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 50, y: 50, width: 200, height: 20))
        slider.maximumValue = 100;
        slider.minimumValue = 0
        slider.value = 70
        slider.isEnabled = true // Enable user interaction
        slider.isContinuous = true
        return slider
    }()
    
    @objc func switchStateChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }
    
    @objc  func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            break
        }
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
    }
    // UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row] // Return the title for the given row and component
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected item: \(items[row])") // Handle the selection of an item
    }
    
    // UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Specify the number of components (in this case, only one)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count // Return the number of rows in the picker view
    }
}


