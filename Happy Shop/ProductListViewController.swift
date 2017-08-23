//
//  ProductListViewController.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

fileprivate let itemsPerRow: CGFloat = 2

import UIKit
import Kingfisher

import Alamofire
import AlamofireObjectMapper
import ObjectMapper


class ProductListViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var emptyStateLabel: UILabel!
    
    var page = 1
    var selectedId: Int!
    
    var productList: ProductsContainerModel!
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JustHUD.shared.showInView(view: view)
        getProducts(pageNo: page)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var button = UIButton()
        button = button.createCustomBarButton()
        
        // Bar button item
        let rightBarButtomItem = UIBarButtonItem(customView: button)
        
        navigationItem.rightBarButtonItem = rightBarButtomItem
    }
    
    
    //Getting product list from API
    func getProducts(pageNo: Int?) {
        
        Alamofire.request(kProductListUrl, method: .get, parameters: ["category": self.category, "page": pageNo!]).responseObject { (response: DataResponse<ProductsContainerModel>) in
            
            JustHUD.shared.hide()
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    if (self.productList == nil){
                        self.productList = response.result.value!
                        
                        if self.productList.products.count == 0 {
                            self.emptyStateLabel.text = String(format: "No product found for %@!", arguments: [self.category])
                            self.collectionView.isHidden = true
                        }
                    }
                    else{
                        let object = response.result.value!
                        self.productList.products += object.products
                    }
                    self.page = self.page + 1
                    self.collectionView.reloadData()
                }
                break
                
            case .failure(_):
                print(response.result.error!)
                break
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! ProductDetailsViewController
        detail.productId = self.selectedId
    }
}


// MARK: - UICollectionViewDataSource & Delegates
extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        if self.productList.products.count-1 == indexPath.row && self.productList.products.count%10 == 0{
            getProducts(pageNo: page)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.productList == nil {
            return 0
        }
        return self.productList.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.productList.products[indexPath.item] as ProductModel!
        self.selectedId = model?.id
        self.performSegue(withIdentifier: "productDetails", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productThumbnail", for: indexPath) as! ProductThumbnailCell
        if self.productList != nil {
            cell.updateWithModel(model: self.productList.products[indexPath.item])
        }
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ProductListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let widthPerItem = (kScreenWidth/itemsPerRow)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}



