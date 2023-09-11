//
//  SignUpViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

class SignUpViewController: UIViewController  {
    
    private let rootView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = rootView
    }
}
