//
//  ProfileViewController.swift
//  MessagingApp
//
//  Created by Егор Горских on 01.03.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
  
  // MARK: - IBOutlets
  private var profileHeaderView = ProfileHeaderView()
  
  
  // MARK: - Life Cycles
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setupProfileHeaderView()
  }
  
  private func setupProfileHeaderView() {
    
    view.addSubview(profileHeaderView)

    profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate(
      [
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        profileHeaderView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
    
    
  }
  
  
  
}
