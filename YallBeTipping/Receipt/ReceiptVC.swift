//
//  ReceiptVC.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit

class ReceiptVC: UIViewController {
    let items: [MenuItem]
    let tip : TipOption
    let total: Double
    init(coder: NSCoder, items:[MenuItem], tip: TipOption){
        self.items = items
        self.tip = tip
        self.total = items.calculateTotal(with: tip)
        super.init(coder: coder)!
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        print(items)
     
    }
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ReceiptVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row < items.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptItemRow") as! ReceiptItemRow
            let item = items[row]
            cell.configure(item: item)
            return cell
        }else if row == items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTipRow") as! ReceiptTipRow
            cell.configure(tip: tip)
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTotalRow") as! ReceiptTotalRow
            cell.configure(total: total)
            return cell
        }
    }
 
}
extension ReceiptVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
