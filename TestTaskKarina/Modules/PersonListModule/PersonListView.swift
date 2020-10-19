//
//  PersonListView.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 03.10.2020.
//

import UIKit

final class PersonListView: UIView, PersonListViewing {
    
    
    unowned private let controller: PersonListControlling
    
    private lazy var pinView: PersonView = {
        let view = PersonView(action: pinViewTapped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return view
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let pinViewHeight: CGFloat = 88
    private lazy var pinViewTopConstraint = pinView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -pinViewHeight)
    
    fileprivate var personItems: [PersonItem] = []
    private var selectedIndex: Int?
    
    
    init(controller: PersonListControlling) {
        self.controller = controller
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setPinViewConstraints()
        setTableViewConstraints()
        super.updateConstraints()
    }
    
    
    func configureView() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonCell.self, forCellReuseIdentifier: PersonCell.identifier)
        tableView.tableFooterView = UIView()
        
        addSubview(pinView)
        addSubview(tableView)
        setNeedsUpdateConstraints()
    }
    
    func setNewItems(_ items: [PersonItem]) {
        self.personItems = items
        if let selectedIndex = selectedIndex {
            pinView.setPerson(personItems[selectedIndex])
        }
        tableView.reloadData()
    }
    
    func setItemSelected(index: Int) {
        if selectedIndex == nil {
            showPinView()
        }
        selectedIndex = index
        let selectedPersonItem = personItems[index]
        pinView.setPerson(selectedPersonItem)
        tableView.reloadData()
    }
    
    func deselectItem() {
        hidePinView()
        selectedIndex = nil
        tableView.reloadData()
    }
    
    
    private func setPinViewConstraints() {
        NSLayoutConstraint.activate([
            pinViewTopConstraint,
            pinView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pinView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pinView.heightAnchor.constraint(equalToConstant: pinViewHeight)
        ])
    }
    
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: pinView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func showPinView() {
        pinViewTopConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    private func hidePinView() {
        pinViewTopConstraint.constant = -pinViewHeight
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    private func pinViewTapped() {
        controller.pinViewTapped()
    }
    
}


extension PersonListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedIndex == nil ? personItems.count : personItems.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonCell.identifier) as? PersonCell else { return UITableViewCell() }
        let addingIndex = (selectedIndex != nil && indexPath.row >= selectedIndex!) ? 1 : 0
        let currentItem = personItems[indexPath.row + addingIndex]
        cell.setPersonItem(currentItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addingIndex = (selectedIndex != nil && indexPath.row >= selectedIndex!) ? 1 : 0
        controller.personSelected(index: indexPath.row + addingIndex)
    }
}
