//
//  MenuCell.swift
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: MenuCell.self)
    
    @IBOutlet weak private var menuOptionTitle: UILabel!
    
    //MARK: - Overrides
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = highlighted ? #colorLiteral(red: 0.1850054569, green: 0.2054257173, blue: 0.2230067027, alpha: 1) : #colorLiteral(red: 0.2235294118, green: 0.2509803922, blue: 0.2705882353, alpha: 1)
    }
    
    //MARK: - Configuration
    
    func configure(withTitle title: String) {
        menuOptionTitle.text = title
    }
    
}
