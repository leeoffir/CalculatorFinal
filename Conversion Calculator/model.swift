//
//  model.swift
//  Conversion Calculator
//
//  Created by Lee Offir on 4/9/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import Foundation

class model {
    var state = 0
    var hasDot = false
    let Array: Array<converter>  = [converter(label: "fahrenheit to celsius", inputUnit: " °F", outputUnit: " °C"),
                                    converter(label: "celsius to fahrenheit", inputUnit: " °C", outputUnit: " °F"),
                                    converter(label: "miles to kilometers", inputUnit: " Mi", outputUnit: " Km"),
                                    converter(label: "kilometers to miles", inputUnit: " Km", outputUnit: " Mi")]
    
    func conversion(_ input: Double) -> String{
        switch state {
        case 0:
            return String(format: "%.2f", (input - 32) * (5/9))
        case 1:
            return String(format: "%.2f", (input * (9/5)) + 32)
        case 2:
            return String(format: "%.2f", (input / 0.621371))
        case 3:
            return String(format: "%.2f", (input * 0.621371))
        default:
            return ""
            
        }
    }
    
}
