//
//  RegistrationController.swift
//  Login
//
//  Created by 송태환 on 2020/05/13.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Properties
    private var viewModel = RegistrationViewModel()

    private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let fullnameTextField = CustomTextField(placeholder: "Fullname")

    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let signUpButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.title = "Sign Up"
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)

        return button
    }()
    
    private let alreadyHaveAccount: TextButton = {
        let button = TextButton(type: .system)
        button.foreTitle = "Already have an account? "
        button.backTitle = "Log in"
        button.addTarget(self, action: #selector(showLoginController), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Selectors
    @objc func handleSignUp() {
        
    }
    
    @objc func showLoginController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(_ sender: UITextField) {
        if emailTextField == sender {
            viewModel.email = sender.text
        } else if passwordTextField == sender {
            viewModel.password = sender.text
        } else {
            viewModel.fullname = sender.text
        }
        
        print("DEBUG: Form is valid \(viewModel.formIsValid)")
        updateForm()
    }
    
    // MARK: - Helpers
    func configureUI() {
        configureGradientBackground()
        
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

        let stack = UIStackView(arrangedSubviews: [emailTextField, fullnameTextField, passwordTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 32).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        
        view.addSubview(alreadyHaveAccount)
        alreadyHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alreadyHaveAccount.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: - FormViewModel
extension RegistrationController: FormViewModel {
    func updateForm() {
        signUpButton.isEnabled = viewModel.shouldEnableButton
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}
