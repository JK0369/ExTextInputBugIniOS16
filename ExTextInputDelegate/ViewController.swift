//
//  ViewController.swift
//  ExTextInputDelegate
//
//  Created by 김종권 on 2023/11/12.
//

import UIKit

class ViewController: UIViewController {
    private let scrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let textView = {
        let t = UITextView()
        t.text = "long \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n input...abcdef123456789"
        t.textColor = .gray
        t.isScrollEnabled = false
        t.font = .systemFont(ofSize: 30)
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    private let button = {
        let b = UIButton()
        b.setTitle("button", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        b.setTitleColor(.systemBlue, for: .highlighted)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(button)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        scrollView.layoutIfNeeded()
    }
}
