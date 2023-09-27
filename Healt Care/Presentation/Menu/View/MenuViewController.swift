//
//  MenuViewController.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 26/09/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    var completion: () -> Void = { }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        showProfileViewController()
    }
    @IBAction func logoutButtonTapped(_ sender: Any) {
        completion()
    }
}

extension UIViewController {
    func showMenuViewController(completion: @escaping () -> Void) {
        let viewController = UIStoryboard.menu.instantiateViewController(withIdentifier: "menu") as! MenuViewController
        viewController.completion = completion
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
