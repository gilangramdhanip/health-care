//
//  HomeViewController.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    @IBOutlet weak var solutionTitleLabel: UILabel!
    @IBOutlet weak var uiTableView: UITableView!
    @IBOutlet weak var welcomeCardView: UIView!
    @IBOutlet weak var serviceCardView: UIView!
    @IBOutlet weak var filterCard: UIView!
    @IBOutlet weak var trackCardView: UIView!
    @IBOutlet weak var searchCard: UIStackView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        setupCollectionView()
    }
    
    func setupView(){
        filterCard.dropShadow()
        searchCard.dropShadow()
        trackCardView.dropShadow()
        welcomeCardView.dropShadow()
        serviceCardView.dropShadow()
        
        let welcomeText = "Solusi, Kesehatan Anda"
        let attText = NSMutableAttributedString(string: welcomeText, attributes: [.font: UIFont(name: "Gilroy-light", size: 18)!, .foregroundColor: UIColor.primaryBlue])
        
        attText.addAttributes([.font: UIFont(name: "Gilroy-ExtraBold", size: 18)!, .foregroundColor: UIColor.primaryBlue], range: NSString(string: welcomeText).range(of: "Kesehatan Anda"))
        solutionTitleLabel.attributedText = attText
        serviceTitleLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 18)
    }
    
    func setupCollectionView(){
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.reloadData()
    }
    
    
    //MARK: Action Navigation Bar
    @IBAction func burgerButtonTapped(_ sender: Any) {
        showMenuViewController {
            PersistanceManager.shared.removeToken()
            let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
            
            if !PersistanceManager.shared.getToken().isEmpty {
                
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "home")
                sceneDelegate.window?.rootViewController = initialViewController
                sceneDelegate.window?.makeKeyAndVisible()
            }else{
                
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "login")
                sceneDelegate.window?.rootViewController = initialViewController
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func notificationButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func shoppingCartButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: Action Welcome Section
    @IBAction func selengkapnyButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: Action Service Section
    @IBAction func daftarTesButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: Action Track Section
    @IBAction func trackButtonTapped(_ sender: Any) {
        
    }
    
    
    
}

extension HomeViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        switch item {
        case .productCategories:
            let cell = tableView.dequeueReusableCell(withIdentifier: "productCategoryCell", for: indexPath) as! ProductCategoriesTableViewCell
            cell.collectionView.tag = HomeViewModel.HomeItem.productCategories.rawValue
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.reloadData()
            return cell
            
        case .product:
            let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductsTableViewCell
            cell.collectionView.tag = HomeViewModel.HomeItem.product.rawValue
            
            let height = 150.0 + 78
            cell.collectionViewHeightConstraint.constant = height
            cell.setNeedsLayout()
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.reloadData()
            return cell
            
        case .serviceCategories:
            let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCategoryCell", for: indexPath) as! ServiceCategoryTableViewCell
            cell.collectionView.tag = HomeViewModel.HomeItem.serviceCategories.rawValue
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.reloadData()
            return cell
            
            
        case .service:
            let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceTableViewCell
            cell.collectionView.tag = HomeViewModel.HomeItem.service.rawValue
            
            let height = 150.0 + 40
            cell.collectionViewHeightConstraint.constant = height
            cell.setNeedsLayout()
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.reloadData()
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let item = HomeViewModel.HomeItem(rawValue: collectionView.tag) {
            switch item {
            case .productCategories:
                return viewModel.dataProductCategoris.count
            case .service:
                return 3
            case .product:
                return 3
            case .serviceCategories:
                return viewModel.dataServiceCategoris.count
            default:
                return 0
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = HomeViewModel.HomeItem(rawValue: collectionView.tag)
        switch item {
        case .productCategories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCategoriesCell", for: indexPath) as! ProductCategoriesCollectionViewCell
            cell.titleLabel.text = viewModel.dataProductCategoris[indexPath.row]
            cell.dropShadow()
            return cell
            
        case .product:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductCollectionViewCell
            cell.titleLabel.text = "Suntik Steril"
            cell.productImageView.image = UIImage(named: "img_telescope")
            cell.priceLabel.text = "Rp. 10000"
            cell.statusCard.backgroundColor = UIColor(hex: "#B3FFCB")
            cell.statusLabel.text = "Ready Stok"
            cell.dropShadow()
            cell.containerCard.layer.cornerRadius = 10
//            cell.containerCard.backgroundColor = UIColor.primaryBlue

            return cell

        case .serviceCategories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCategoriesCell", for: indexPath) as! ServiceCategoriesCollectionViewCell
            cell.titleLabel.text = viewModel.dataServiceCategoris[indexPath.row]
            cell.dropShadow()
            return cell

        case .service:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "servicesCell", for: indexPath) as! ServiceCollectionViewCell
            cell.titleLabel.text = "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja"
            cell.serviceImageView.image = UIImage(named: "img_hospital")
            cell.priceLabel.text = "Rp. 10000"
            cell.hostpitalNameLabel.text = "Lenmarc Surabaya"
            cell.hospitalAddressLabel.text = "Dukuh Pakis, Surabaya"
            cell.dropShadow()
            cell.containerCard.layer.cornerRadius = 10

            return cell
        case .none:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductCollectionViewCell

            return cell
        }
    }
}

//// MARK: - UICollectionViewDelegateFlowLayout
//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let item = HomeViewModel.HomeItem(rawValue: collectionView.tag)!
//        switch item {
//        case .productCategories:
//            var width = UIScreen.main.bounds.width - 40
//            width = viewModel.dataProductCategoris.count > 1 ? width * 90 / 100 : width
//            return CGSize(width: width, height: 30)
//        case .serviceCategories:
//            var width = UIScreen.main.bounds.width - 40
//            width = viewModel.dataServiceCategoris.count > 1 ? width * 90 / 100 : width
//            return CGSize(width: width, height: 30)
//
//        case .service:
//            var width = UIScreen.main.bounds.width - 40
//            width = 3 > 1 ? width * 90 / 100 : width
//            return CGSize(width: width, height: width * 9 / 21)
//
//        default:
//            return .zero
//        }
//    }
//}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = HomeViewModel.HomeItem(rawValue: collectionView.tag) {
            switch item {
            case .productCategories:
                break
            default:
                break
            }
        }
    }
}

extension UIViewController {
    func showHomeViewController() {
        let viewController = UIStoryboard.home.instantiateViewController(withIdentifier: "home") as! HomeViewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
