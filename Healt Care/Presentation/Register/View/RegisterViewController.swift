//
//  RegisterViewController.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var welcomeSubtitleLabel: UILabel!
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var namaDepanTextField: UITextField!
    @IBOutlet weak var namaBelakangTextField: UITextField!
    @IBOutlet weak var noKtpTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var noTelponTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var loginSekarangLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var ktpStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    
    func setupView(){
        namaDepanTextField.dropShadow()
        namaBelakangTextField.dropShadow()
        noKtpTextField.dropShadow()
        emailTextField.dropShadow()
        noTelponTextField.dropShadow()
        passwordTextField.dropShadow()
        confirmPasswordTextField.dropShadow()
        
        emailTextField.dropShadow()
        passwordTextField.dropShadow()
        let welcomeText = "Hai, Selamat Datang"
        let attText = NSMutableAttributedString(string: welcomeText, attributes: [.font: UIFont(name: "Gilroy-light", size: 28)!, .foregroundColor: UIColor.primaryBlue])
        
        attText.addAttributes([.font: UIFont(name: "Gilroy-ExtraBold", size: 28)!, .foregroundColor: UIColor.primaryBlue], range: NSString(string: welcomeText).range(of: "Selamat Datang"))
        welcomeTitleLabel.attributedText = attText
        
        
        let login = "Sudah punya akun? Login sekarang"
        let loginText = NSMutableAttributedString(string: login, attributes: [.font: UIFont(name: "Gilroy-light", size: 14)!, .foregroundColor: UIColor.gray])
        
        loginText.addAttributes([.font: UIFont(name: "Gilroy-ExtraBold", size: 14)!, .foregroundColor: UIColor.primaryBlue], range: NSString(string: login).range(of: "Login sekarang"))
        
        loginSekarangLabel.attributedText = loginText
        
        let loginSekarangLabelTapped = UITapGestureRecognizer(target: self, action: #selector(loginSekarangTapped))
        loginSekarangLabel.addGestureRecognizer(loginSekarangLabelTapped)
        
        
    }
    
    @objc func loginSekarangTapped(sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        showHomeViewController()
    }
    
}

extension UIViewController {
    func showRegisterViewController() {
        let viewController = UIStoryboard.register.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
