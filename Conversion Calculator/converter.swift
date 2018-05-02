//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Lee Offir on 4/9/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import Foundation

struct converter {
    let label: String
    let input: String
    let output: String
    
    init(label: String, inputUnit: String, outputUnit: String){
        self.label = label
        self.input = inputUnit
        self.output = outputUnit
    }
}
