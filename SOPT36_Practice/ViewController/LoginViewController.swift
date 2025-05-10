//
//  LoginViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import UIKit

final class LoginViewController: UIViewController {

    private var loginId: String = ""
    private var password: String = ""
    private var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc private func registerButtonTap() {
        Task {
            do {
                let response = try await LoginService.shared.postLoginData(
                    loginId: loginId,
                    password: password
                )
                
                let nicknameVC = NickNameViewController(userId: response.userId)
                self.navigationController?.pushViewController(nicknameVC, animated: true)
                
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                print("로그인 에러:", error)
            }
        }
    }
    

    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        default:
            password = textField.text ?? ""
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
        
        [idTextField, passwordTextField, registerButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    
    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }
    
    private lazy var registerButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
    }

}
