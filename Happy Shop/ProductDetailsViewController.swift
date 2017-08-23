//
//  ProductDetailsViewController.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


class ProductDetailsViewController: UIViewController {

    @IBOutlet var tblView: UITableView!
    var productId: Int!
    var product: ProductModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblView.estimatedRowHeight = 44.0
        self.tblView.rowHeight = UITableViewAutomaticDimension
        
        getProductDetails()
    }

    //Getting product list from API
    
    func getProductDetails() {
        
        JustHUD.shared.showInView(view: view)
        
        let url = String(format: "http://sephora-mobile-takehome-2.herokuapp.com/api/v1/products/%d.json", arguments: [self.productId])
        
        Alamofire.request(url, method: .get, parameters:nil).responseObject(keyPath: "product") { (response: DataResponse<ProductModel>) in
            
            JustHUD.shared.hide()
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    self.product = response.result.value!
                    self.title = self.product.name
                }
                self.tblView.reloadData()
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

}


// MARK: - TableView Delegates
extension ProductDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if self.product != nil {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
                (cell as! ProductImageViewCell).updateWithModel(model: self.product)
            }
            else if indexPath.row == 1{
                cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
                (cell as! ProductTitleCell).updateWithModel(model: self.product)
            }
            else if indexPath.row == 2 {
                cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            }
            else if indexPath.row == 3{
                cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
                (cell as! ProductDescriptionCell).updateWithModel(model: self.product)
            }
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            
            //Using Userdefaults to store product IDs which are added to cart
            //Realm or coredata should be implemented if add to cart functionality is extended to separate cart screen with full cart features
            var tableData = (UserDefaults.standard.object(forKey: "cartItems") as! NSArray).mutableCopy() as! NSMutableArray
            if tableData.count == 0{
                tableData = NSMutableArray()
            }
            tableData.add(self.product.id!)
            UserDefaults.standard.setValue(tableData, forKey: "cartItems")
            
            DispatchQueue.main.async(execute: {
                let message = "Product added to cart."
                let myAlert = UIAlertController(title: "Added", message: message, preferredStyle: .alert);
                myAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(myAlert, animated: true, completion: nil)
            })
        }
    }
}



