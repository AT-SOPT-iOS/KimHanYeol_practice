//
//  UIFont+.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/7/25.
//

import UIKit

enum FontWeight: String {
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case semiBold = "Pretendard-SemiBold"
    case bold = "Pretendard-Bold"
}

enum SoptFontStyle {
    
    //head
    case head1Regular
    case head1Medium
    case head1Bold
    case head1SemiBold
    
    //subhead
    case subhead1Regular
    case subhead1Medium
    case subhead1Bold
    case subhead1SemiBold
    
    case subhead2Regular
    case subhead2Medium
    case subhead2Bold
    case subhead2SemiBold
    
    case subhead3Regular
    case subhead3Medium
    case subhead3Bold
    case subhead3SemiBold
    
    case subhead4Regular
    case subhead4Medium
    case subhead4Bold
    case subhead4SemiBold
    
    case subhead5Regular
    case subhead5Medium
    case subhead5Bold
    case subhead5SemiBold
    
    //info
    case info12Regular
    case info12Medium
    case info12Bold
    case info12SemiBold
    
}

extension UIFont {
    
    static func customFont(weight: FontWeight, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size)!
    }
    
    static func soptFont(_ style: SoptFontStyle) -> UIFont {
        switch style {
            
            //head
        case .head1Bold: return UIFont(name: FontWeight.bold.rawValue, size: 25)!
        case .head1Medium: return UIFont(name: FontWeight.medium.rawValue, size: 25)!
        case .head1Regular: return UIFont(name: FontWeight.regular.rawValue, size: 25)!
        case .head1SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 25)!
            
            //subhead
        case .subhead1Bold: return UIFont(name: FontWeight.bold.rawValue, size: 18)!
        case .subhead1Medium: return UIFont(name: FontWeight.medium.rawValue, size: 18)!
        case .subhead1Regular: return UIFont(name: FontWeight.regular.rawValue, size: 18)!
        case .subhead1SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 18)!
            
        case .subhead2Bold: return UIFont(name: FontWeight.bold.rawValue, size: 16)!
        case .subhead2Medium: return UIFont(name: FontWeight.medium.rawValue, size: 16)!
        case .subhead2Regular: return UIFont(name: FontWeight.regular.rawValue, size: 16)!
        case .subhead2SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 16)!
            
        case .subhead3Bold: return UIFont(name: FontWeight.bold.rawValue, size: 15)!
        case .subhead3Medium: return UIFont(name: FontWeight.medium.rawValue, size: 15)!
        case .subhead3Regular: return UIFont(name: FontWeight.regular.rawValue, size: 15)!
        case .subhead3SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 15)!
            
        case .subhead4Bold: return UIFont(name: FontWeight.bold.rawValue, size: 14)!
        case .subhead4Medium: return UIFont(name: FontWeight.medium.rawValue, size: 14)!
        case .subhead4Regular: return UIFont(name: FontWeight.regular.rawValue, size: 14)!
        case .subhead4SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 14)!
            
        case .subhead5Bold: return UIFont(name: FontWeight.bold.rawValue, size: 14)!
        case .subhead5Medium: return UIFont(name: FontWeight.medium.rawValue, size: 14)!
        case .subhead5Regular: return UIFont(name: FontWeight.regular.rawValue, size: 14)!
        case .subhead5SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 14)!
            
            //info
        case .info12Bold: return UIFont(name: FontWeight.bold.rawValue, size: 12)!
        case .info12Medium: return UIFont(name: FontWeight.medium.rawValue, size: 12)!
        case .info12Regular: return UIFont(name: FontWeight.regular.rawValue, size: 12)!
        case .info12SemiBold: return UIFont(name: FontWeight.semiBold.rawValue, size: 12)!
        }
    }
}
