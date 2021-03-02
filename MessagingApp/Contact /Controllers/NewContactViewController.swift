//
//  NewContactViewController.swift
//  MessagingApp
//
//  Created by Егор Горских on 01.03.2021.
//

import UIKit

final class NewContactViewController: UIViewController {
  // MARK: - Properties
  private let profileImageView = ProfileImageView(borderShape: .squircle, boldBorder: false)
  
  private let firstNameTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "First name"
    return textField
  }()
  
  private let lastNameTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "Last name"
    return textField
  }()
  
  private var constraints: [NSLayoutConstraint] = []
  
  // MARK: - Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "New Contact"
    setupLeftBarButton()
    setupRightBarButton()
    setupViewTapGesture()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    dismissKeyboard(view)
  }
  
  // MARK: - Layouts
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    if !constraints.isEmpty {
      NSLayoutConstraint.deactivate(constraints)
      constraints.removeAll()
    }
    setupViewLayout()
  }
  
  private func setupLeftBarButton() {
    let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(leftBarButtonItemDidTap(_:)))
    navigationItem.leftBarButtonItem = barButtonItem
  }
  
  private func setupRightBarButton() {
    let barButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightBarButtonItemDidTap(_:)))
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  private func setupViewTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
    view.addGestureRecognizer(tapGesture)
  }
  
  private func setupViewLayout() {

  }
  
  // MARK: - Action
    
  @objc private func leftBarButtonItemDidTap(_ sender: UIBarButtonItem) {
    DispatchQueue.main.async { [weak self] in
      self?.dismiss(animated: true)
    }
  }
  
  @objc private func rightBarButtonItemDidTap(_ sender: UIBarButtonItem) {
    DispatchQueue.main.async { [weak self] in
      self?.dismiss(animated: true)
    }
  }
  
  @objc private func dismissKeyboard(_ sender: UIView) {
    DispatchQueue.main.async { [weak self] in
      self?.view.endEditing(true)
    }
  }
}
