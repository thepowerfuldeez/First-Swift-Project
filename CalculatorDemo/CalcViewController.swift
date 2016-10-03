//
//  ViewController.swift
//  CalculatorDemo
//
//  Created by George on 19.09.16.
//  Copyright © 2016 George Grigorev. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    var first_number: Double = 0
    var number = ""
    var command = ""
    var pointIsPressed = false
    
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func ClearEntry(_ sender: UIButton) {
        textLabel.text = ""
        number = ""
        command = ""
        first_number = 0
        pointIsPressed = false
    }
    
    @IBAction func NumberIsPressed(_ sender: AnyObject) {
        if pointIsPressed {
            return
        }
        if let pressed_number: String = sender.currentTitle {
            switch pressed_number {
            case "-":
                number = "-" + number
            case ".":
                number += "."
                pointIsPressed = true
            default:
                number += pressed_number
            }
            textLabel.text?.append(pressed_number)
        }
    }
    
    @IBAction func OperatorButtonIsPressed(_ sender: UIButton) {
        if first_number == 0 {
            first_number = Double(number)!
            number = ""
            pointIsPressed = false
            
            if let operator_: String = sender.currentTitle {
                command = operator_
                textLabel.text?.append(" \(operator_) ")
            }
        }
    }
    
    
    @IBAction func EqualButtonPressed(_ sender: UIButton) {
        if !command.isEmpty {
            let result: String = calculateExpression(operand1: first_number, operand2: Double(number)!, command: command)
            setExpression(value: result)
        }
    }

    func setExpression(value: String) {
        expressionLabel.text = value
    }
    
    func calculateExpression(operand1: Double, operand2: Double, command: String) -> String {
        switch command {
            case "+":
                return String((operand1 + operand2))
            case "-":
                return String((operand1 - operand2))
            case "*":
                return String((operand1 * operand2))
            case "/":
                return String((operand1 / operand2))
            default:
                return ""
        }
    }

}

extension CalcViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpression(value: "0")
        
    }
}
