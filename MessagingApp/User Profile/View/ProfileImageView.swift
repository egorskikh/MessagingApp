//
//  ProfileImageView.swift
//  MessagingApp
//
//  Created by Егор Горских on 01.03.2021.
//

import UIKit

final class ProfileImageView: UIImageView {
  
  //  Сначала вы объявляете перечисление BorderShape . Это содержит дополнительный случай отсутствия, когда вы хотите, чтобы представление изображения не имело определенной формы границы. Обратите внимание, что модификатор доступа для BorderShape больше не является частным . Вместо этого он внутренний, поскольку для свойства не объявлен другой явный модификатор доступа. Это сделано для того, чтобы BorderShape стал доступным для других объектов при инициализации ProfileImageView . boldBorder используется для определения ширины границы слоя ProfileImageView, когда hasBorder имеет значение true . Когда hasBorder являетсяfalse , ширина границы слоя представления просто устанавливается равной нулю.
  enum BorderShape: String {
    case circle
    case squircle
    case none
  }
  
  let boldBorder: Bool
  
  var hasBorder: Bool = false {
    didSet {
      guard hasBorder else { return layer.borderWidth = 0 }
      layer.borderWidth = boldBorder ? 10 : 2
    }
  }
  
  //  У вас также есть borderShape , который был изменен с строкового типа на использование перечисления. Одним из больших преимуществ создания пользовательского интерфейса в коде является то, что вы можете использовать гораздо больше замечательных функций Swift. В Interface Builder настройка свойства представления с помощью перечисления на самом деле не является вариантом.
  private let borderShape: BorderShape
  
  //  Затем есть init (borderShape: boldBorder :) . Этот метод инициализирует ProfileImageView , принимая параметры borderShape и boldBorder и соответствующим образом задавая свойства класса. Затем метод вызывает метод инициализатора суперкласса и передает. Ноль для кадра. Размер кадра не имеет значения, поскольку ProfileImageView будет использовать автоматический макет для определения размера и положения представления. Затем вы устанавливаете светло-серый цвет фона.
  init(borderShape: BorderShape, boldBorder: Bool = true) {
    self.borderShape = borderShape
    self.boldBorder = boldBorder
    super.init(frame: CGRect.zero)
    backgroundColor = .lightGray
  }
  
  //  Здесь у вас есть удобный инициализатор, который устраняет необходимость передавать BorderShape в первый инициализатор. Этот удобный инициализатор позволяет инициализировать ProfileImageView как ProfileImageView () . Когда вы используете этот удобный инициализатор, для borderShape установлено значение none .
  convenience init() {
    self.init(borderShape: .none)
  }
  
  //  Наконец, у вас есть init (coder :) , который используется при создании ProfileImageView в Interface Builder. В этом случае, вы инициализировать borderShape к ни и boldBorder к ЛЖИ . Вы добавили тип значения, свойства и методы инициализатора. Пришло время настроить границу.
  required init?(coder aDecoder: NSCoder) {
    self.borderShape = .none
    self.boldBorder = false
    super.init(coder: aDecoder)
  }
  
  // layoutSubviews () вызывается, когда компоновка на основе ограничений завершила настройку. Это время, когда ProfileImageView устанавливает форму границы представления, вызывая setupBorderShape ()
  override func layoutSubviews() {
    super.layoutSubviews()
    setupBorderShape()
  }
  private func setupBorderShape() {
    hasBorder = borderShape != .none
    
    // Внутри setupBorderShape () , borderShape определяет радиус угла. Когда borderShape представляет собой круг , радиус угла слоя будет составлять половину ширины представления. Когда borderShape представляет собой сквикл , радиус угла слоя будет составлять четверть ширины вида. Когда для borderShape установлено значение none , радиус угла слоя будет равен 1
    let width = bounds.size.width
    let divisor: CGFloat
    
    switch borderShape {
    case .circle:
      divisor = 2
    case .squircle:
      divisor = 4
    case .none:
      divisor = width
    }
    let cornerRadius = width / divisor
    layer.cornerRadius = cornerRadius
  }
  
}
