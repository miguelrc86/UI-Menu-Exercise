//
//  DetailViewController.swift
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import UIKit

final class DetailViewController: UITableViewController {
    
    var viewModel = DetailViewModel() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfEvents()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.model(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseIdentifier, for: indexPath) as! DetailCell
        cell.configure(with: model, option: viewModel.selectedOption)
        
        return cell
    }
    
}

