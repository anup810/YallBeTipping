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
        setupTableView()

    }

    func fetchData(){
       data = Api.shared.fetchData()
    }
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        let item = data[indexPath.row]
        cell.configure(item: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
