//
//  ViewController.swift
//  Calculator
//
//  Created by Smart Castle M1A2006 on 14.10.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var currentValueLabel: UILabel!
    
    
    
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var devineButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var number7Button: UIButton!
    @IBOutlet weak var number8Button: UIButton!
    @IBOutlet weak var number9Button: UIButton!
    @IBOutlet weak var number4Button: UIButton!
    @IBOutlet weak var number5Button: UIButton!
    @IBOutlet weak var number6Button: UIButton!
    @IBOutlet weak var number1Button: UIButton!
    @IBOutlet weak var number2Button: UIButton!
    @IBOutlet weak var number3Button: UIButton!
    @IBOutlet weak var number0button: UIButton!
    
    @IBOutlet weak var pointButton: UIButton!
    
    
    var currentValue = 0
    var UserisinProgress: Bool = false
    @IBAction func CalculatorButtonPressed(_ sender: UIButton) {
       print ("sender:titleLabel?text)")
        guard let text = sender.titleLabel?.text else { return }
   
        switch text {
        case "AC":
            print("case: AC")
            currentValue = 0
        case "+/-":
            print("case: +/-")
            currentValue = currentValue * -1
        case "%":
            print ("case: %")
            currentValue = currentValue %  Int (text)!
        case "/":
            print ("case: /")
            currentValue = currentValue / Int (text)!
        case "X":
            print ("case: X")
        case "-":
            print ("case: -")
        case "+":
            print ("case: +")
        case "=":
            print ("case:=")
        case ".":
            print ("case .")
            
            
            
        default:
            
            if UserisinProgress {
                currentValueLabel.text = displayedText+text
            }else {
                currentValueLabel.text = (text)
                UserisinProgress = true
                
            break
                
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

