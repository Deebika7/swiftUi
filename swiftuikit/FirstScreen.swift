//
//  ViewController.swift
//  swiftuikit
//
//  Created by deebika-pt6680 on 12/04/23.
//

import UIKit

class FirstScreen: UIViewController {

    //button instance
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title
        title = "First Screen"
        setupButton()
        //setting background color to the launch screen
        view.backgroundColor = .systemYellow
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //adding button to the scene
    func setupButton() {
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemRed
        nextButton.configuration?.title = "Next"
        // should be set for all ui element
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        //button styling
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        //button action --- navigating to next screen
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
    @objc func goToNextScreen() {
        let nextScreen = SecondScreen()
        nextScreen.title = "Second Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
    

}

