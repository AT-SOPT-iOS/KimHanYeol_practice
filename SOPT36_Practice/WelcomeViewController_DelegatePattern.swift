//
//  WelcomeViewController_DelegatePattern.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/7/25.
//

import UIKit

protocol DataBindDelegate: AnyObject {
    func databind(id: String)
}

class WelcomeViewController_DelegatePattern: UIViewController {
    weak var delegate : DataBindDelegate?
    var id: String?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .carrotIcon))
        imageView.frame = CGRect(x: 112, y: 87, width: 150, height: 150)
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .customFont(weight: .bold, size: 25)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .customFont(weight: .bold, size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 182/255, green: 172/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .customFont(weight: .bold, size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUI()
        bindID()
    }
    
    private func setUI() {
        self.view.addSubviews(imageView, welcomeLabel, mainButton, backButton)
    }
    
    private func bindID() {
        self.welcomeLabel.text = "\(id!)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        
        if let id = id {
            delegate?.databind(id: id)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
