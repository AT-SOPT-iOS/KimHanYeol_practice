//
//  ViewController.swift
//  SOPT36_Practice
//
//  Created by OneTen on 4/6/25.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    private let tableView = UITableView()
    
    private let chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        self.view.addSubview(tableView)
        
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        tableView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.cellIdentifier)
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.cellIdentifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }

}
