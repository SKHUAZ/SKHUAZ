//
//  CustomDropdownMenu.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/19.
//

import UIKit

import Then
import SnapKit

protocol DropdownMenuSearchDelegate: AnyObject {
    func dropdownMenuDidSelectOption(_ option: String, for button: UIButton)
}

class CustomDropdownMenuSearch: UIView, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    weak var delegate: DropdownMenuSearchDelegate?

    private var options: [String] = []
    private var filteredOptions: [String] = [] // 검색된 옵션을 저장할 배열
    private let tableView = UITableView()
    private let searchBar = UISearchBar()
    private var parentButton: UIButton?
    var isDropdownVisible: Bool = false // 드롭다운 메뉴의 가시성을 추적합니다.

    init(options: [String], parentButton: UIButton) {
        super.init(frame: .zero)
        self.options = options
        self.parentButton = parentButton
        setUI()
        setLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        
        searchBar.do {
            $0.delegate = self
            $0.placeholder = "검색"
        }
        
        tableView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    private func setLayout() {
        addSubviews(searchBar, tableView)

        searchBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(176)
        }
    }

    func showDropdown() {
        isDropdownVisible = true
        filteredOptions = options // 최초에는 모든 옵션 표시
        tableView.reloadData()
        // 여기에서 드롭다운 메뉴를 표시하는 코드를 추가하세요.
    }

    func hideDropdown() {
        isDropdownVisible = false
        removeFromSuperview()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // 검색어가 비어있으면 모든 옵션을 표시
            filteredOptions = options
        } else {
            // 검색어가 있으면 필터링하여 결과 저장
            filteredOptions = options.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOptions.count // 필터된 결과의 개수를 반환
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filteredOptions[indexPath.row] // 필터된 결과를 표시
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
        hideDropdown()
    }
}
