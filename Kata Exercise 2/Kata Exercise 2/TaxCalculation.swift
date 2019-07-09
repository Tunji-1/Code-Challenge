//
//  TaxCalculation.swift
//  Kata Exercise 2
//
//  Created by Tunji on 09/07/2019.
//  Copyright © 2019 Kenjii. All rights reserved.
//

import Foundation

enum USState: String {
    case WA, OR, CA, ID, NV, MT, WY, UT, AZ, CO, NM, ND, SD, NE, KS, OK, TX, MN, IA, MO, AR, LA, WI, IL, TN, MS, MI, IN, KY, AL, NY, ME, PA, WV, NC, SC, GA, FL, AK, HI, MA, RI, CT, NJ, DE, MD, DC, OH, VT, NH
    
    var taxRate: Double {
        
        switch self {
        case .WA: return 8.92
        case .OR: return  20
        case .CA: return 8.48
        case .ID: return 6.03
        case .NV: return 7.98
        case .MT: return 0
        case .WY: return 5.42
        case .UT: return 6.76
        case .AZ: return 8.25
        case .CO: return 7.5
        case .NM: return 7.55
        case .ND: return 6.78
        case .SD: return 6.34
        case .NE: return 6.87
        case .KS: return 8.61
        case .OK: return 8.85
        case .TX: return 8.17
        case .MN: return 7.31
        case .IA: return 6.80
        case .MO: return 7.87
        case .AR: return 9.30
        case .LA: return 9.98
        case . WI: return 5.41
        case .IL: return 8.65
        case .TN: return 9.45
        case .MS: return 7.07
        case .MI: return 6
        case .IN: return 7
        case .KY: return 6
        case .AL: return 8.97
        case .NY: return 8.49
        case .ME: return 5.5
        case .PA: return 6.34
        case .WV: return 6.29
        case .NC: return 6.90
        case .SC: return 7.23
        case .GA: return 7
        case .FL: return 6.66
        case .AK: return 1.78
        case .HI: return 4.35
        case .MA: return 6.25
        case .RI: return 7
        case .CT: return 6.35
        case .NJ: return 6.97
        case .DE: return 0
        case .MD: return 6
        case .DC: return 5.75
        case .OH: return 7.14
        case .VT: return 6.17
        case .NH: return 0
        }
    }
}

enum taxCalculationError: Error {
    case stateCodeError
}

enum ItemTypes: String {
    case TV = "TV"
    case  Bike = "Bike"
    case Cloth = "Cloth"
}


class CalculateTax {
    
    func calculateTotal(_ productName: String, _ quantity: Int, _ unitPrice: Double) -> Double {
        
        let price = Double(Double(quantity) * unitPrice)
        return price
    }
    
    func taxCalculation(_ productName: String, _ quantity: Int , _ unitPrice: Double, _ stateCode: USState)-> Double{
        
        let gross = Double(Double(quantity) * unitPrice)
        let code = stateCode.taxRate
        let taxDivsion = code / 100
        let taxDeduction  =  Double(gross  * taxDivsion)
        _ = gross + taxDeduction
       return taxDeduction
    }
    
    func discountCalculation(_ total: Double) -> Double {
      var discount = 0.0
        switch  total {
        case 0..<1000:
            discount  = 0.0
        case 1000 ..< 5000:
            discount = 3
        case 5000 ..< 7000:
            discount = 5
        case 7000 ..< 10000:
            discount = 7
        case 10000 ..< 50000:
            discount = 10
        default:
            discount  = 15
        }
        
        let percentage = discount / 100
        let discountedPrice = total  * percentage
        let newTotal = total - discountedPrice
        
        return newTotal
    }
}
