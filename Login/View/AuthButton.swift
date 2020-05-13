//
//  AuthButton.swift
//  Login
//
//  Created by 송태환 on 2020/05/13.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        isEnabled = false
        setHeight(height: 50)
        setTitle("Log in", for: .normal)
        setTitleColor(UIColor(white: 1, alpha: 0.67), for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
