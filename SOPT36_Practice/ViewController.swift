//
//  ViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/6/25.
//

import UIKit

class ViewController: UIViewController {
    let viewWidth = UIScreen.main.bounds.width / 2
    let viewHeight = UIScreen.main.bounds.height / 4
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubviews(yellowView, greenView, blackView, blueView)
    }
    
    private func setLayout() {
        
        NSLayoutConstraint
            .activate(
                [
                    yellowView.topAnchor.constraint(equalTo: view.topAnchor),
                    yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    yellowView.widthAnchor.constraint(equalToConstant: viewWidth),
                    yellowView.heightAnchor.constraint(equalToConstant: viewHeight),
                    
                    greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
                    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    greenView.widthAnchor.constraint(equalToConstant: viewWidth),
                    greenView.heightAnchor.constraint(equalToConstant: viewHeight),
                    
                    blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    blackView.widthAnchor.constraint(equalToConstant: viewWidth),
                    blackView.heightAnchor.constraint(equalToConstant: viewHeight),
                    
                    blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
                    blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    blueView.widthAnchor.constraint(equalToConstant: viewWidth),
                    blueView.heightAnchor.constraint(equalToConstant: viewHeight)

                ]
            )

    }

}

