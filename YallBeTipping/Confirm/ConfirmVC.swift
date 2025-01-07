//
//  ConfrimVC.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit

class ConfirmVC: UIViewController {
    let items: [MenuItem]
    
    init(coder:NSCoder,items:[MenuItem]){
        self.items = items
        super.init(coder: coder)!
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(items)
    }
    


}
