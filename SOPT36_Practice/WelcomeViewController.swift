//
//  WelcomeViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/7/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    var id: String?

    private func bindID() {
        self.welcomeLabel.text = "\(id!)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        label.layer.cornerRadius = 3
        return label
    }()
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
}
