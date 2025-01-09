//
//  Extension.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-08.
//

import Foundation

extension [MenuItem]{
    func calculateTotal(with tip: TipOption) -> Double{
        var total:Double = 0
        self.forEach { item in
            let count = Double(item.count)
            let sum = item.price * count
            
            total += sum
        }
        return total * tip.rawValue
        
    }
}
