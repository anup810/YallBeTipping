//
//  HomeViewController.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit


class HomeViewController: UIViewController{
    
    var data:[MenuItem] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
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
    
    @IBAction func didTapCartButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "ConfirmVC", bundle: nil)
        let items:[MenuItem] = getMenuItems()
        let vc = storyBoard.instantiateViewController(identifier: "ConfirmVC") { coder in
            let ConfirmVC = ConfirmVC(coder: coder, items: items)
            return ConfirmVC
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func getMenuItems() -> [MenuItem]{
        var items:[MenuItem] = []
        for item in data{
            if item.count > 0{
                items.append(item)
            }
            
        }
        return items
    }
    
    
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        let item = data[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
   
}
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
        
    }
    
}
extension HomeViewController: HomeTableCellDelegate{
    func didAdd(at indexPath: IndexPath) {
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        data[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none )
    }

}
