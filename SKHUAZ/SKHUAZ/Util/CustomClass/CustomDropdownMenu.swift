//
//  CustomDropdownMenu.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/11.
//

import UIKit

import SnapKit
import Then

protocol DropdownMenuDelegate: AnyObject {
    func dropdownMenuDidSelectOption(_ option: String, for button: UIButton)
}

class CustomDropdownMenu: UIView, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: DropdownMenuDelegate?
    
    private var options: [String] = []
    private let tableView = UITableView()
    private var parentButton: UIButton?
    
    init(options: [String], parentButton: UIButton) {
        super.init(frame: .zero)
        self.options = options
        self.parentButton = parentButton
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.showsVerticalScrollIndicator = false

        addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(176)
            //            make.width.equalTo(353) --> 이거 사용할 때 버튼 자체의 width를 체크해야함
        }
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedOption = tableView.cellForRow(at: indexPath)?.textLabel?.text else {
            return
        }
        delegate?.dropdownMenuDidSelectOption(selectedOption, for: parentButton!)
        parentButton?.setTitleWithLeftPadding(selectedOption, for: .normal, leftPadding: 13)
        parentButton?.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        removeFromSuperview()
    }
    
}
