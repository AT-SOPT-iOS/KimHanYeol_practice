//
//  ViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/6/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redView, orangeView, yellowView, greenView, blueView, purpleView)
    }
    
    private func setLayout() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.heightAnchor.constraint(equalToConstant: 300),
            redView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orangeView.heightAnchor.constraint(equalToConstant: 300),
            orangeView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.heightAnchor.constraint(equalToConstant: 300),
            yellowView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 300),
            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: 300),
            blueView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.heightAnchor.constraint(equalToConstant: 300),
            purpleView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
}

