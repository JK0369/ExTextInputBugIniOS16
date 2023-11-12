//
//  ViewController.swift
//  ExTextInputDelegate
//
//  Created by 김종권 on 2023/11/12.
//

import UIKit

class ViewController: UIViewController {
    private let textField: UITextField = {
        let t = UITextField()
        t.placeholder = "input..."
        t.textColor = .gray
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        textField.inputDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ViewController: UITextInputDelegate {
    func selectionWillChange(_ textInput: UITextInput?) {
        print("selectionWillChange")
    }
    
    func selectionDidChange(_ textInput: UITextInput?) {
        print("selectionDidChange")
    }
    
    func textWillChange(_ textInput: UITextInput?) {
        print("textWillChange")
    }
    
    func textDidChange(_ textInput: UITextInput?) {
        print("textDidChange")
    }
}
