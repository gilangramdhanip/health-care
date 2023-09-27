//
//  ProfileViewController.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileCardView: UIView!
    @IBOutlet weak var formCardView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView(){
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.selectedSegmentTintColor = UIColor.cyan
        
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal)
        segmentedControl.backgroundColor = UIColor.white
        formCardView.dropShadow()
    }
    
    
    //MARK: Action Navigation Bar
    @IBAction func burgerButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func notificationButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func shoppingCartButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: Action Simpan Profile
    @IBAction func simpanProfileButtonTapped(_ sender: Any) {
        
    }
    
    
}

extension UIViewController {
    func showProfileViewController() {
        let viewController = UIStoryboard.profile.instantiateViewController(withIdentifier: "profile") as! ProfileViewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
