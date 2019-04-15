//
//  HomeViewController.swift
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak private var mainContainerXCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak private var mainContainerView: UIView?
    
    private var isMenuOpened = false
    private var embededMenu: MenuViewController!
    private var detailVC: DetailViewController!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let embededMenuSegue = segue.destination as? MenuViewController {
            embededMenu = embededMenuSegue
            embededMenu.delegate = self
        }
        
        if let detailSegue = segue.destination as? DetailViewController {
            detailVC = detailSegue
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Actions
    
    @IBAction private func menuButtonWasTapped(_ sender: UIButton) {
        toggleMenu()
    }
    
    private func updateDetailController(forMenuOption option: MenuOption) {
        detailVC.viewModel.selectedOption = option
    }
    
    //MARK: - Utilities
    
    private func toggleMenu() {
        let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.6) {
            self.mainContainerXCenterConstraint.constant = self.isMenuOpened ? 0 : UIScreen.main.bounds.size.width * 0.75
            self.view.layoutIfNeeded()
            self.isMenuOpened = !self.isMenuOpened
        }
        
        animator.startAnimation()
    }
    
}

extension HomeViewController: MenuViewControllerDelegate {
    
    func userDidTapMenuOption(option: MenuOption) {
        toggleMenu()
        updateDetailController(forMenuOption: option)
    }
    
}
