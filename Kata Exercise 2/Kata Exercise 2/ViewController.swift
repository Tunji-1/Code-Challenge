//
//  ViewController.swift
//  Kata Exercise 2
//
//  Created by Tunji on 09/07/2019.
//  Copyright © 2019 Kenjii. All rights reserved.
//

import UIKit

struct Item {
    var type: ItemTypes
    var unitPrice: Double
    var quantity: Int
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var items = [Item]()
        let calculateTax = CalculateTax()
        
        items.append(Item(type: .TV, unitPrice: 2500.00, quantity: 3))
        items.append(Item(type: .Bike, unitPrice: 1400.00, quantity: 2))
        items.append(Item(type: .Bike, unitPrice: 1400.00, quantity: 5))
        var itemDetails = 0.0, totalCalculated = 0.0, discountCalculated = 0.0
        
        for item in items {
            itemDetails += calculateTax.taxCalculation(item.type.rawValue, item.quantity, item.unitPrice, .OR)
            totalCalculated  +=  calculateTax.calculateTotal(item.type.rawValue, item.quantity , item.unitPrice)
            discountCalculated += totalCalculated - calculateTax.discountCalculation(totalCalculated)
            print("\(item.type.rawValue)\t\(item.quantity)\t\(item.unitPrice)\t\(calculateTax.calculateTotal(item.type.rawValue, item.quantity , item.unitPrice))")
        }
        
        print("--------------------")
        print(totalCalculated - itemDetails)
        print(discountCalculated)
        print(itemDetails)
        print("--------------------")
        print("Total Price      \(totalCalculated - discountCalculated)")
    }
}
