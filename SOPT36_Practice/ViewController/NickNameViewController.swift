//
//  NickNameViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 5/7/25.
//

import UIKit

import SnapKit
import Then

final class NickNameViewController: UIViewController {
    
    // MARK: - Properties

    private var userId: Int
    private var myNickname: String = ""
    private var newNickname: String = ""

    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
        self.fetchMyNickname()
    }

    // MARK: - Actions
    
    private func fetchMyNickname() {
        Task {
            do {
                let fetchedNickname = try await GetInfoService.shared.fetchMyNickname(
                    userId: userId
                )
                self.myNickname = fetchedNickname
                self.infoLabel.text = "현재 닉네임: \(fetchedNickname)"
            } catch {
                self.infoLabel.text = "닉네임 조회 실패: \(error.localizedDescription)"
            }
        }
    }

    @objc private func updateNicknameTap() {
        Task {
            do {
                let response = try await NickNameService.shared.postNicknameData(
                    nickName: newNickname,
                    userId: userId
                )
                self.myNickname = newNickname
                self.infoLabel.text = "닉네임이 '\(myNickname)'(으)로 변경되었습니다."
            } catch {
                self.infoLabel.text = "닉네임 변경 실패: \(error.localizedDescription)"
            }
        }
    }

    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.newNickname = textField.text ?? ""
    }

    // MARK: - Layout

    private func setLayout() {
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }

        [nicknameTextField, infoLabel, updateButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }

    // MARK: - UI Components

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var nicknameTextField = UITextField().then {
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
        $0.backgroundColor = .lightGray
        $0.placeholder = "바꿀 닉네임을 입력하세요"
        $0.layer.cornerRadius = 8
//        $0.setLeftPadding(12)
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private lazy var updateButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(updateNicknameTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("닉네임 수정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private lazy var infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
    }
}
