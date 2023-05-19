//
//  ScrollView.swift
//  swiftuikit
//
//  Created by deebika-pt6680 on 03/05/23.
//

import UIKit

class ScrollView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
    }
    
    private lazy var contentView: UIStackView = {
        let contentView = UIStackView()
        contentView.backgroundColor = .blue
        return contentView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
//    private lazy var containerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private let blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .systemBlue
        blueView.layer.cornerRadius = 20
        return blueView
    }()
    
    private let orangeView: UIView = {
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        orangeView.layer.cornerRadius = 20
        return orangeView
    }()
    
    private let redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 20
        return redView
    }()
    
    func setUpScrollView() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(blueView)
        contentView.addArrangedSubview(orangeView)
        contentView.addArrangedSubview(redView)
        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
        
          contentView.axis = .vertical
//        contentView.distribution = .fill
//        contentView.alignment = .fill
//
        scrollView.addSubview(contentView)
//        view.addSubview(testView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//
            blueView.heightAnchor.constraint(equalToConstant: 300),
            blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            orangeView.heightAnchor.constraint(equalToConstant: 300),
            orangeView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            redView.heightAnchor.constraint(equalToConstant: 300),
            redView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    
    

}
