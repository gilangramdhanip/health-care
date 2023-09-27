//
//  LoginViewController.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var welcomeSubtitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var daftarSekarangLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    func setupView(){
        emailTextField.dropShadow()
        passwordTextField.dropShadow()
        let welcomeText = "Hai, Selamat Datang"
        let attText = NSMutableAttributedString(string: welcomeText, attributes: [.font: UIFont(name: "Gilroy-light", size: 28)!, .foregroundColor: UIColor.primaryBlue])
        
        attText.addAttributes([.font: UIFont(name: "Gilroy-ExtraBold", size: 28)!, .foregroundColor: UIColor.primaryBlue], range: NSString(string: welcomeText).range(of: "Selamat Datang"))
        welcomeTitleLabel.attributedText = attText
        
        let register = "Belum punya akun? Daftar Sekarang"
        let registerText = NSMutableAttributedString(string: register, attributes: [.font: UIFont(name: "Gilroy-light", size: 14)!, .foregroundColor: UIColor.gray])
        
        registerText.addAttributes([.font: UIFont(name: "Gilroy-ExtraBold", size: 14)!, .foregroundColor: UIColor.primaryBlue], range: NSString(string: register).range(of: "Daftar Sekarang"))
        
        daftarSekarangLabel.attributedText = registerText
        
        let daftarSekarangLabelTapped = UITapGestureRecognizer(target: self, action: #selector(daftarSekarangTapped))
        daftarSekarangLabel.addGestureRecognizer(daftarSekarangLabelTapped)

    }
    
    @objc func daftarSekarangTapped(sender: UITapGestureRecognizer) {
        showRegisterViewController()
    }

    @IBAction func loginButtnTapped(_ sender: Any) {
        loginViewModel.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { login in
            if !login.token.isEmpty {
                self.showHomeViewController()
            }
        }
    }
}

extension UIViewController {
    func showLoginViewController() {
        let viewController = UIStoryboard.login.instantiateViewController(withIdentifier: "login") as! LoginViewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
