//
//  MenuViewController.swift
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func userDidTapMenuOption(option: MenuOption)
}

final class MenuViewController: UIViewController {
    
    var viewModel = MenuViewModel()
    weak var delegate: MenuViewControllerDelegate?
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier) as! MenuCell
        cell.configure(withTitle: model.rawValue)
        
        return cell
    }
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = viewModel.options[indexPath.row]
        delegate?.userDidTapMenuOption(option: model)
    }
    
}
