//
//  LoginController.swift
//  Login
//
//  Created by 송태환 on 2020/05/08.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties

    private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)

        let foreFont: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 15)]
        let backFont: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: "Forgot your password? ", attributes: foreFont)
        attributedTitle.append(NSAttributedString(string: "Get help signing in", attributes: backFont))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(showForgotPassword), for: .touchUpInside)

        return button
    }()
    
    private let dividerView = DividerView()
    
    private let googleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "btn_google_light_pressed_ios").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("  Log in with Google", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)

        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let foreFont: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 15)]
        let backFont: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: foreFont)
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: backFont))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleDontHaveAccount), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Selector
    @objc func handleLogin() {
        print("click!")
    }
    
    @objc func showForgotPassword() {
        print("click! Forgot password ")
    }
    
    @objc func handleGoogleLogin() {
        print("click! google!")
    }
    
    @objc func handleDontHaveAccount() {
        print("Click! Don't have account!")
    }
    
    // MARK: - Helper
    func configureUI() {
        // MARK: - navigation configuration
        // Navigation bar 숨김 여부
        navigationController?.navigationBar.isHidden = true
        
        // barStytle: bar 배경색을 정의
        // .default -> 하얀 배경에 검정 글씨, .black -> 검정 배경에 흰 글씨
        navigationController?.navigationBar.barStyle = .black
    
        // MARK: - Gradient Layer
        // 그라디언트 인스턴스 from Core Animation
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        // MARK: - Icon Image
        // View에 icon image 붙이기
        view.addSubview(iconImage)
        iconImage.setDimensions(height: 120, width: 120)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

        // MARK: - Stack View
        // Create Stack View
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 20

        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        let secondStack = UIStackView(arrangedSubviews: [forgotPasswordButton, dividerView, googleLoginButton])
        secondStack.axis = .vertical
        secondStack.spacing = 28
        view.addSubview(secondStack)
        secondStack.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
//        dontHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
//        dontHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
}
