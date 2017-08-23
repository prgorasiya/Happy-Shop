//
//  ViewController.swift
//  Happy Shop
//
//  Created by Paras Gorasiya on 21/8/17.
//  Copyright © 2017 Paras Gorasiya. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var categories = [CategoryModel]()
    var selectedCategory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        
        createCategories()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var button = UIButton()
        button = button.createCustomBarButton()
        
        // Bar button item
        let rightBarButtomItem = UIBarButtonItem(customView: button)
        
        navigationItem.rightBarButtonItem = rightBarButtomItem
    }
    
    
    //Creating categories and adding to tableview
    func createCategories() {

        let cat1 = CategoryModel()
        cat1.name = "Makeup"
        
        let cat2 = CategoryModel()
        cat2.name = "Skin Care"
        
        let cat3 = CategoryModel()
        cat3.name = "Hair"
        
        let cat4 = CategoryModel()
        cat4.name = "Tools & Brushes"
        
        self.categories = [cat1, cat2, cat3, cat4]
        
        self.tableView.reloadData()
    }
    
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let productListView = segue.destination as! ProductListViewController
        productListView.category = self.selectedCategory
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cat = self.categories[indexPath.item]
        cell.textLabel!.textColor = kDefaultGrey
        cell.textLabel!.text = cat.name
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.categories[indexPath.row]
        self.selectedCategory = model.name
        self.performSegue(withIdentifier: "productList", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

