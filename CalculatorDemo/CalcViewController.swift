//
//  ViewController.swift
//  CalculatorDemo
//
//  Created by George on 19.09.16.
//  Copyright © 2016 George Grigorev. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    var command_querry = ["+": [Int](), "-": [Int](), "/": [Int](), "*": [Int]()]
    var number = ""
    var latest_command = ""
    
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func ClearEntry(_ sender: UIButton) {
        textLabel.text = ""
        command_querry = ["+": [Int](), "-": [Int](), "/": [Int](), "*": [Int]()]
        number = ""
    }
    
    @IBAction func One(_ sender: UIButton) {
        number.append("1")
        textLabel.text?.append("1")
    }
    @IBAction func Two(_ sender: UIButton) {
        number.append("2")
        textLabel.text?.append("2")
    }
    @IBAction func Three(_ sender: UIButton) {
        number.append("3")
        textLabel.text?.append("3")
    }
    @IBAction func Four(_ sender: UIButton) {
        number.append("4")
        textLabel.text?.append("4")
    }
    @IBAction func Five(_ sender: UIButton) {
        number.append("5")
        textLabel.text?.append("5")
    }
    @IBAction func Six(_ sender: UIButton) {
        number.append("6")
        textLabel.text?.append("6")
    }
    @IBAction func Seven(_ sender: UIButton) {
        number.append("7")
        textLabel.text?.append("7")
    }
    @IBAction func Eight(_ sender: UIButton) {
        number.append("8")
        textLabel.text?.append("8")
    }
    @IBAction func Nine(_ sender: UIButton) {
        number.append("9")
        textLabel.text?.append("9")
    }
    @IBAction func Plus(_ sender: UIButton) {
        if !number.isEmpty {
            textLabel.text?.append(" + ")
            command_querry["+"]?.append(Int(number)!)
            number = ""
            latest_command = "+"
        }
    }
    @IBAction func Minus(_ sender: UIButton) {
        if !number.isEmpty {
            textLabel.text?.append(" - ")
            command_querry["-"]?.append(Int(number)!)
            number = ""
            latest_command = "-"
        }
    }
    @IBAction func Multiply(_ sender: UIButton) {
        if !number.isEmpty {
            textLabel.text?.append(" * ")
            command_querry["*"]?.append(Int(number)!)
            number = ""
            latest_command = "*"
        }
    }
    @IBAction func Divide(_ sender: UIButton) {
        if !number.isEmpty {
            textLabel.text?.append(" / ")
            command_querry["/"]?.append(Int(number)!)
            number = ""
            latest_command = "/"
        }
    }
    
    
    @IBAction func EqualButtonPressed(_ sender: UIButton) {
        if !latest_command.isEmpty {
            command_querry[latest_command]?.append(Int(number)!)
            let result: String = calculateExpression()
            setExpression(value: result)
        }
    }

    func setExpression(value: String) {
        expressionLabel.text = value
    }
    
    func calculateExpression() -> String {
        var res = 0
        if (command_querry["*"]?.count)! + (command_querry["/"]?.count)! > 0 {
            res = 1
            res = (command_querry["*"]?.reduce(res, *))!
            res = (command_querry["/"]?.reduce(res, /))!
            res = (command_querry["+"]?.reduce(res, +))!
            res = (command_querry["-"]?.reduce(res, -))!
        }
        else {
            res = (command_querry["+"]?.reduce(res, +))!
            res = (command_querry["-"]?.reduce(res, -))!
        }
        
        return String(res)
    }

}

extension CalcViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpression(value: "0")
        
    }
}
