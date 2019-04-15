//
//  MenuViewModel.swift
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import Foundation

enum MenuOption: String {
    case option1 = "Option 1"
    case option2 = "Option 2"
    case option3 = "Option 3"
}

struct MenuViewModel {    
    var options: [MenuOption] = [.option1, .option2, .option3]
}
