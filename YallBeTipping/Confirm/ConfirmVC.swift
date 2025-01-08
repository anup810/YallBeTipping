//
//  ConfrimVC.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit

class ConfirmVC: UIViewController {
    var items: [MenuItem]
    
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Submit", style: .plain, target:self, action: #selector(didTapBarButton))
        return button
    }()
    
    @IBOutlet weak var tableView: UITableView!
    init(coder:NSCoder,items:[MenuItem]){
        self.items = items
        super.init(coder: coder)!
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton


        
    }
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ConfirmCell", bundle: nil), forCellReuseIdentifier: "ConfirmCell")
        
    }
    @objc func didTapBarButton(){
        let storyBoard = UIStoryboard(name: "TipVC", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "TipVC") {[unowned self] coder in
            let TipVC = TipVC(coder: coder, items: items)
            return TipVC
        }
        navigationController?.pushViewController(vc, animated: true)
        
        
    }

}
extension ConfirmVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmCell") as! ConfirmCell
        let item = items[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
        
    }
    
    
}
extension ConfirmVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}
extension ConfirmVC: ConfirmCellDelegate{
    func didAdd(at indexPath: IndexPath) {
        items[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        items[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none )
    }
    
    
}
