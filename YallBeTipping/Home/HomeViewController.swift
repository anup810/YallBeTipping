//
//  HomeViewController.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit

class HomeViewController: UIViewController {
    var data:[MenuItem] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }

    func fetchData(){
       data = Api.shared.fetchData()
    }

}

