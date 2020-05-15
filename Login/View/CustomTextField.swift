//
//  CustomTextField.swift
//  Login
//
//  Created by 송태환 on 2020/05/13.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        // add leading space with UIView
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        self.leftView = spacer
        self.leftViewMode = .always

        self.setHeight(height: 50)
        self.borderStyle = .none
        self.keyboardAppearance = .dark
        self.backgroundColor = UIColor(white: 1, alpha: 0.1)
        self.textColor = UIColor(white: 1, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        self.autocorrectionType = .no
        self.autocapitalizationType = .none

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
