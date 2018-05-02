//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Lee Offir on 4/9/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
   

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
   let modelClass = model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text = modelClass.Array[0].output
        inputDisplay.text = modelClass.Array[0].input
    }
    
    @IBAction func conversionClick(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: modelClass.Array[0].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.modelClass.state = 0
            self.updateButton()
        }))
        alert.addAction(UIAlertAction(title: modelClass.Array[1].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.modelClass.state = 1
            self.updateButton()
        }))
        alert.addAction(UIAlertAction(title: modelClass.Array[2].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.modelClass.state = 2
            self.updateButton()
        }))
        alert.addAction(UIAlertAction(title: modelClass.Array[3].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.modelClass.state = 3
            self.updateButton()
            //chooses which conversion state to be in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sign(_ sender: Any)
    {
        var inputString = inputDisplay.text
        if(inputString!.hasPrefix(" "))
        {
            return
        }
        else
        {
            if(inputString!.hasPrefix("-"))
            {
                inputString!.remove(at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabel()
                if(inputString != ".")
                {
                    let inputConvert = Double(inputString!)
                    outputDisplay.text = modelClass.conversion(inputConvert!) + modelClass.Array[modelClass.state].output
                }
                else
                {
                    outputDisplay.text = inputString! + modelClass.Array[modelClass.state].output
                }
                
            }
            else
            {
                inputString!.insert("-", at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabel()
                if(inputString != "-.")
                {
                    let inputConvert = Double(inputString!)
                    outputDisplay.text = modelClass.conversion(inputConvert!) + modelClass.Array[modelClass.state].output
                }
                else{
                    outputDisplay.text = inputString! + modelClass.Array[modelClass.state].output
                }
            }
        }
    }
    
    @IBAction func buttonClick(_ sender: UIButton)
    {
        
        updateNumberButton(sender.titleLabel!.text!)
    }
    
    
    func updateNumberButton (_ input: String)
    {
        if (input == "." && modelClass.hasDot == true)
        {
            return
        }
        if(input == "." && modelClass.hasDot == false){
            modelClass.hasDot = true
        }
        
        var inputString = removeLabel()
        
        inputString = inputString + input
        
        let inputConvert = Double(inputString)
        inputString = inputString + modelClass.Array[modelClass.state].input
        
        if(inputString.hasPrefix(".")){
            inputDisplay.text = inputString
            outputDisplay.text = input + modelClass.Array[modelClass.state].output
        }
        
        else{
            inputDisplay.text = inputString
            outputDisplay.text = modelClass.conversion(inputConvert!) + modelClass.Array[modelClass.state].output
        }
    }
    
    func updateButton()
    {
        let inputString = removeLabel()
        let inputConvert = Double(inputString)
        inputDisplay.text = inputString + modelClass.Array[modelClass.state].input
        
        if (inputString != "")
        {
            if(inputString != "." && inputString != "-.")
            {
                outputDisplay.text = modelClass.conversion(inputConvert!) + modelClass.Array[modelClass.state].output
            }
            else
            {
                outputDisplay.text = inputString + modelClass.Array[modelClass.state].output

            }
           
        }
        else
        {
            outputDisplay.text = modelClass.Array[modelClass.state].output
        }
    }

    func removeLabel() -> String
    {
        var inputString = inputDisplay.text
        let inputLabel = (inputString!.index(inputString!.endIndex, offsetBy: -3))..<inputString!.endIndex
        inputString!.removeSubrange(inputLabel)
        return inputString!
        //removes and switches the unites
    }

   
    @IBAction func clear(_ sender: UIButton)
    {
        inputDisplay.text = modelClass.Array[modelClass.state].input
        outputDisplay.text = modelClass.Array[modelClass.state].output
        modelClass.hasDot = false
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
