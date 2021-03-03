//
//  ProfileViewController.swift
//  MessagingApp
//
//  Created by Егор Горских on 01.03.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
  
  // MARK: - Properties
  
  private let profileHeaderView = ProfileHeaderView()
  private let mainStackView = UIStackView()
  private let scrollView = UIScrollView()
  
  // MARK: - Life Cycles
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    setupScrollView()
    setupMainStackView()
  }
  
  // MARK: - Layouts
  private func setupProfileHeaderView() {
    mainStackView.addArrangedSubview(profileHeaderView)
    profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
    profileHeaderView.heightAnchor.constraint(equalToConstant: 360).isActive = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  private func setupMainStackView() {
    mainStackView.axis = .vertical
    mainStackView.distribution = .equalSpacing
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    
    //1
    scrollView.addSubview(mainStackView)
    
    //2
    let contentLayoutGuide = scrollView.contentLayoutGuide
    
    NSLayoutConstraint.activate([
      //3
      mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
      mainStackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
      mainStackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
      mainStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
      //4
      mainStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
    ])
    
    setupProfileHeaderView()
    setupButtons()
  }
  
  private func setupScrollView() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)
    
    let frameLayoutGuide = scrollView.frameLayoutGuide
    
    NSLayoutConstraint.activate([
      frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

// MARK: - Buttons Configuration
extension ProfileViewController {
  private func createButton(text: String, color: UIColor = .blue) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 55).isActive = true
    button.setTitle(text, for: .normal)
    button.setTitleColor(color, for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
    button.contentHorizontalAlignment = .left
    
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }
  
  @objc private func buttonPressed(_ sender: UIButton) {
    let buttonTitle = sender.titleLabel?.text ?? ""
    let message = "\(buttonTitle) button has been pressed"
    
    let alert = UIAlertController(
      title: "Button Pressed",
      message: message,
      preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default)
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  func setupButtons() {
    let buttonTitles = [
      "Share Profile", "Favorites Messages", "Saved Messages",
      "Bookmarks", "History", "Notifications", "Find Friends",
      "Security", "Help", "Logout"]
    
    let buttonStack = UIStackView()
    buttonStack.translatesAutoresizingMaskIntoConstraints = false
    buttonStack.alignment = .fill
    buttonStack.axis = .vertical
    buttonStack.distribution = .equalSpacing
    
    buttonTitles.forEach { (buttonTitle) in
      buttonStack.addArrangedSubview(createButton(text: buttonTitle))
    }
    
    mainStackView.addArrangedSubview(buttonStack)
    NSLayoutConstraint.activate([
      buttonStack.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
      buttonStack.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor)
    ])
  }
}

