//
//  TextButton.swift
//  Login
//
//  Created by 송태환 on 2020/05/13.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class TextButton: UIButton {
    var attributedTitle: NSMutableAttributedString?
    
    var foreTitle: String? {
        didSet {
            let foreFont: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 15)]
            attributedTitle = NSMutableAttributedString(string: foreTitle!, attributes: foreFont)
        }
    }
    
    var backTitle: String? {
        didSet {
            let backFont: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 15)]
            attributedTitle?.append(NSAttributedString(string: backTitle! , attributes: backFont))
            setAttributedTitle(attributedTitle, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
