//
//  HomeViewModel.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import Foundation

class HomeViewModel {
    
    enum HomeItem: Int {
        case productCategories = 94
        case product = 95
        case serviceCategories = 96
        case service = 97
    }
    
    let dataProductCategoris = ["All Product", "Layanan Kesehatan", "Alat Kesehatan"]
    let dataServiceCategoris = ["Semua", "Paket Pemeriksaan"]
    
    let items : [HomeItem] = [.productCategories, .product, .serviceCategories, .service]
    
}
