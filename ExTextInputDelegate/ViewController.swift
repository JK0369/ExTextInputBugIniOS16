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
        let t = SelfSizingTextView()
        t.text = "long \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n input...ab😉cd\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nf123456789"
        t.textColor = .gray
        t.isScrollEnabled = true
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

class SelfSizingTextView: UITextView {
    override var intrinsicContentSize: CGSize {
        contentSize
    }
    
    override func layoutSubviews() {
        invalidateIntrinsicContentSize()
        super.layoutSubviews()
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        scrollView.scrollToCursor(in: textView)
    }
    
}

extension UIScrollView {
    func scrollToCursor(in textView: UITextView) {
        guard let selectedRange = textView.selectedTextRange else { return }
        let cursorRect = textView.caretRect(for: selectedRange.start)
        let cursorRectInScrollView = textView.convert(cursorRect, to: self)
        let visibleRect = CGRect(x: 0, y: contentOffset.y, width: bounds.size.width, height: bounds.size.height)
        
        if !visibleRect.contains(cursorRectInScrollView.origin) {
            scrollRectToVisible(cursorRectInScrollView, animated: true)
        }
    }
}
