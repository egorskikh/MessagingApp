//
//  ProfileNameLabel.swift
//  MessagingApp
//
//  Created by Егор Горских on 01.03.2021.
//

import UIKit

final class ProfileNameLabel: UILabel {
  
  // Замените текст, чтобы добавить наблюдателя didSet . Каждый раз при изменении текстового значения будет вызываться didSet . Безопасно разверните с помощью оператора защиты, чтобы убедиться, что есть хотя бы одно слово, которое нужно извлечь из текста . Если текст равен нулю , просто вернитесь и ничего не делайте. Если текст не равен нулю , добавьте \n между каждым словом. \n Сепаратор создает межстрочный интервал между каждым словом. После этого текст ProfileImageView устанавливается на новую строку, соединенную созданным вами разделителем.
  override var text: String? {
    
    didSet {
      guard let words = text?
              .components(separatedBy: .whitespaces)
      else { return }
        
      let joinedWords = words.joined(separator: "\n")
        
      guard text != joinedWords else { return }
      
      DispatchQueue.main.async { [weak self] in
        self?.text = joinedWords
      }
    }
    
  }
  // Метод инициализатора принимает параметры для установки своих свойств и вызывает init (frame :) суперкласса. Затем вы вызываете setTextAttributes (), чтобы настроить некоторые свойства UILabel
  init(fullName: String? = "Full Name") {
    super.init(frame: .zero)
    
    setTextAttributes()
    text = fullName
  }
  
  // Требуемый инициализатор для инициализации Interface Builder ProfileNameLabel
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
  }
  
  // Устанавливает numberOfLines , textAlignment и шрифт характеристики.
  private func setTextAttributes() {
    numberOfLines = 0
    textAlignment = .center
    font = UIFont.boldSystemFont(ofSize: 24)
  }
  
}

