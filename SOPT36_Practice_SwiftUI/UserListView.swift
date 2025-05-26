//
//  UserListView.swift
//  SOPT36_Practice_SwiftUI
//
//  Created by OneTen on 5/24/25.
//

import SwiftUI

struct User: Hashable {
    let name: String
    let age: Int
}

struct UserListView: View {
    let users = [
        User(name: "김가현", age: 24),
        User(name: "이지민", age: 25),
        User(name: "박수연", age: 26)
    ]

    var body: some View {
        NavigationStack {
            List(users, id: \.name) { user in
                NavigationLink(value: user) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text("나이: \(user.age)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("사용자 목록")
            .navigationDestination(for: User.self) { selectedUser in
                UserDetailView(user: selectedUser)
            }
        }
    }
}

struct UserDetailView: View {
    let user: User

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .resizable()
                .frame(width: 140, height: 120)
                .foregroundColor(.green)

            Text(user.name)
                .font(.title)
                .bold()

            Text("나이: \(user.age)세")
                .font(.title2)

            Spacer()
        }
        .padding()
        .navigationTitle("상세 정보")
    }
}

#Preview {
    UserListView()
}
