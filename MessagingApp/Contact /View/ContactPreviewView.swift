//
//  ContactPreviewView.swift
//  MessagingApp
//
//  Created by Егор Горских on 01.03.2021.
//

import UIKit

@IBDesignable final class ContactPreviewView: UIView {
  
  // MARK: - Properties
    
    @IBOutlet var photoImageView: ProfileImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var contentView: UIView!
  
  let nibName = "ContactPreviewView"
  
  // MARK: - Initializers
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    loadView()
  }
  
  // MARK: - Setup Views
    
  func loadView() {
    let bundle = Bundle(for: ContactPreviewView.self)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiate(withOwner: self).first as! UIView
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
  }
  
}

