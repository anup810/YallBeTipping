//
//  Api.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import Foundation

class Api{
    static let shared = Api()
    private init() {}
    
    func fetchData() -> [MenuItem]{
        return[
        MenuItem(name: "Burger", price: 12.5, img: "burger"),
        MenuItem(name: "Burger", price: 12.5, img: "chowMein"),
        MenuItem(name: "Dumpling", price: 12.5, img: "dumplings"),
        MenuItem(name: "Fried Chicken", price: 12.5, img: "friedChicken"),
        MenuItem(name: "Pizza", price: 12.5, img: "pizza"),
        MenuItem(name: "Spaghetti", price: 12.5, img: "spaghetti"),
        MenuItem(name: "Steak", price: 12.5, img: "steak"),
        MenuItem(name: "Sushi", price: 12.5, img: "sushi")
        ]
    }
}
