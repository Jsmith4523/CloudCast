//
//  Double+EXT.swift
//  CloudCast
//
//  Created by Jaylen Smith on 9/28/23.
//

import Foundation

enum Degree: String, CaseIterable {
    case fahrenheit = "Fahrenheit"
    case celsius    = "Celsius"
    
    var symbol: String {
        switch self {
        case .fahrenheit:
            return "ºF"
        case .celsius:
            return "ºC"
        }
    }
    
    func convert(_ value: Double) -> Double {
        switch self {
        case .fahrenheit:
            return (9/5 * value) - 32
        case .celsius:
            return (value - 32) * 5/9
        }
    }
}

extension Double {
    
    func covert(to degree: Degree) -> String {
        return "\(String(format: "%.2f", degree.convert(self))) \(degree.symbol)"
    }
}
