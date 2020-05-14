//
//  ResetPasswordController.swift
//  Login
//
//  Created by 송태환 on 2020/05/14.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ResetPassswordController: UIViewController {
    // MARK: - Properties
    private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let resetPasswordButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.title = "Reset Link"
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifectycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Selectors
    @objc func handleResetPassword() {
        
    }
    
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
        
    // MARK: - Helpers
    func configureUI() {
        configureGradientBackground()
        
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, resetPasswordButton])
        // Constraint 추가전에 반드시 addSubview 호출!!!
        view.addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 32).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
    }
}
