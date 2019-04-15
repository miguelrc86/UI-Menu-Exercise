//
//  DetailCell.swift
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak private var detailImageView: UIImageView!
    @IBOutlet weak private var detailLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var detailImageViewWidth: NSLayoutConstraint!
    @IBOutlet weak private var detailImageViewLeadingConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = String(describing: DetailCell.self)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        detailLabel.text = nil
        descriptionLabel.text = nil
        detailImageView.image = nil
        detailImageViewWidth.constant = 0
        detailImageViewLeadingConstraint.constant = 0
    }
    
    func configure(with model: EventDetail?, option: MenuOption) {
        detailLabel.text = model?.name
        descriptionLabel.text = model?.description
        
        if option == .option2 {
            detailImageViewWidth.constant = 0
            detailImageViewLeadingConstraint.constant = 0
        } else if option == .option1 || (option == .option3 && Int.random(in: 1..<7) % 2 == 0) {
            detailImageViewWidth.constant = 100
            detailImageViewLeadingConstraint.constant = 16
        }
        
        if let imagePath = model?.image {
            detailImageView.image = UIImage(named: imagePath)
        }
    }
    
}
