//
//  ThirdScreen.swift
//  swiftuikit
//
//  Created by deebika-pt6680 on 18/04/23.
//

import UIKit

//UIVIEW

class UIViews: UIViewController, UITextInputTraits, UIScrollViewDelegate //UITextFieldDelegate
{
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(cgColor: UIColor.lightGray.cgColor)
        let firstView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 100))
        view.addSubview(firstView)
        firstView.backgroundColor = .black
        //view.isMultipleTouchEnabled = true
        //firstView.clipsToBounds = true
//        firstView.alpha = 0.5
//        firstView.isHidden = true
        let secondView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 100))
        firstView.addSubview(secondView)
        secondView.backgroundColor = .white
//        secondView.alpha = 0.5
        secondView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)

        //Label
        // to display text
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        label.text = "Test"
        label.textAlignment = .center
        view.addSubview(label)
        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/3)
        
        let imageView = UIImageView(frame: CGRect(x: 50, y: 400, width: 200, height: 200))
        imageView.image = UIImage(named: "testImage")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        textField.frame = CGRect(x: 20, y: 600, width: 200, height: 30)
        textField.placeholder = "Enter phone number"
        textField.borderStyle = .roundedRect
        //textField.delegate = self
        textField.keyboardType = .phonePad
        //textField.keyboardDismissMode = .onDrag
        view.addSubview(textField)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add), target: self, action: #selector(addNavigation))
    }
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//                textField.becomeFirstResponder()
//
//            }
    
//    @objc func addNavigation() {
//        let vc = FourthScreen()
//        vc.title = "AutoLayout Login Form"
//        navigationController?.pushViewController(vc, animated: true)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    


}
