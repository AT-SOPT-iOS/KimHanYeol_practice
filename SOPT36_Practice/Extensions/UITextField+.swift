//
//  UITextField+.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/25/25.
//

import UIKit

extension UITextField {
    
    func configureDefaultSettings() {
        self.autocorrectionType = .no           // 자동 수정 비활성화
        self.spellCheckingType = .no            // 맞춤법 검사 비활성화
        self.autocapitalizationType = .none     // 자동 대문자 비활성화
        self.clearButtonMode = .always          // 입력내용 한번에 지우는 x버튼(오른쪽)
        self.clearsOnBeginEditing = false       // 편집 시 기존 텍스트필드값 초기화 안되게끔
    }
    
    // 왼쪽 패딩
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
}
