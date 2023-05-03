//
//  ViewController.swift
//  UIElements
//
//  Created by deebika-pt6680 on 24/04/23.
//

import UIKit

class FourthScreen: UIViewController {
// buttons, textfields
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            // Adding subviews
            view.addSubview(emailTextField)
            view.addSubview(passwordTextField)
            view.addSubview(loginButton)

            // Set up constraints
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            loginButton.translatesAutoresizingMaskIntoConstraints = false

            //Set navagation bar Item
            configureNavBarItem()
        
            NSLayoutConstraint.activate([
                emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                emailTextField.widthAnchor.constraint(equalToConstant: 200),
                emailTextField.heightAnchor.constraint(equalToConstant: 40),

                passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
                passwordTextField.widthAnchor.constraint(equalToConstant: 200),
                passwordTextField.heightAnchor.constraint(equalToConstant: 40),

                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                loginButton.widthAnchor.constraint(equalToConstant: 200),
                loginButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    private func configureNavBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNavigation))
    }
    
    @objc func addNavigation() {
        let vc = FifthScreen()
        vc.title = "UI Elements"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Email or username input field
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or Username"
        textField.borderStyle = .roundedRect
        //textField.frame = CGRect(x: 100, y: 50, width: 200, height: 40)
        return textField
    }()

    // Password input field
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true //masks words with bullet
        return textField
    }()

    // Login button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        return button
    }()
    
    
}

