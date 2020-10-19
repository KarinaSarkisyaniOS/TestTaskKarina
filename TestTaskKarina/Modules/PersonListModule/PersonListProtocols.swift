//
//  PersonListProtocols.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 03.10.2020.
//

import UIKit

protocol PersonListViewing: UIView {
    func configureView()
    func setNewItems(_ items: [PersonItem])
    func setItemSelected(index: Int)
    func deselectItem()
}

protocol PersonListControlling: UIViewController {
    func personSelected(index: Int)
    func pinViewTapped()
}
