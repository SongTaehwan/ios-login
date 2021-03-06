//
//  Service.swift
//  Login
//
//  Created by 송태환 on 2020/05/15.
//  Copyright © 2020 Song. All rights reserved.
//

typealias DatabaseCompletion = ((Error?, DatabaseReference) -> Void)

import Foundation
import Firebase
import GoogleSignIn

struct Service {
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUserWithFirebase(withEmail email: String, password: String, fullname: String, completion: @escaping DatabaseCompletion) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to create user: \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["email": email, "fullname": fullname]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: completion)
        }
    }
    
    static func signInWithGoogle(didSignFor user: GIDGoogleUser, completion: @escaping DatabaseCompletion) {
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, err) in
            if let error = err {
                print("DEBUG: Failed to sign in with google: \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            guard let email = result?.user.email else { return }
            guard let fullname = result?.user.displayName else { return }
            let values = ["email": email, "fullname": fullname]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: completion)
        }
    }
}
