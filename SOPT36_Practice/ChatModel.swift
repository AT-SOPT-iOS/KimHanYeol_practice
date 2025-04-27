//
//  ChatModel.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/26/25.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .profile1, name: "김가현", place: "광진구", message: "내말에답장해줘", itemImg: .product1),
            ChatModel(profileImg: .profile2, name: "김현수", place: "여의도", message: "마크내사랑", itemImg: .product2),
            ChatModel(profileImg: .profile3, name: "서주영", place: "잠실", message: "마크내꺼", itemImg: .product3),
            ChatModel(profileImg: .profile4, name: "권석기", place: "회기", message: "나는 민경훈", itemImg: .product4),
            ChatModel(profileImg: .profile5, name: "김나연", place: "미국", message: "타코팔러가야돼", itemImg: .product5),
            ChatModel(profileImg: .profile6, name: "정정욱", place: "중국", message: "보쌈정식13000원", itemImg: .product6),
            ChatModel(profileImg: .profile7, name: "서상원", place: "일본", message: "잠실의주인은두산이다", itemImg: .product7),
            ChatModel(profileImg: .profile8, name: "임재현", place: "태국", message: "뒷풀이갈게", itemImg: .product8),
            ChatModel(profileImg: .profile2, name: "이은지", place: "명왕성", message: "은지야술먹자", itemImg: .product1),
            ChatModel(profileImg: .profile3, name: "성현주", place: "안드로메다", message: "응애~", itemImg: .product2),
            ChatModel(profileImg: .profile2, name: "김한열", place: "뭘보슈", message: "생일추카해한열오빠", itemImg: .product1)
        ]
    }
}
