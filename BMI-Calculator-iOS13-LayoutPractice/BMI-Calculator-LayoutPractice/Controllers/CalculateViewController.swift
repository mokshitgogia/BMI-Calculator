//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue="0.0"
    
    var calculatorBrain=CalculatorBrain()
    
    @IBAction func weightSlider(_ sender: UISlider){
        print(String(format: "%0.0f",sender.value))
        updateWeight.text=String(format: "%0.0f",sender.value)+"kg"
    }
    @IBAction func heightSlider(_ sender: UISlider) {
        print(String(format: "%0.2f",sender.value))
        updateheight.text=String(format: "%0.2f",sender.value)+"m"
    }
    @IBOutlet weak var heightchanged: UISlider!
    @IBOutlet weak var weightChanged: UISlider!
    @IBOutlet weak var updateWeight: UILabel!
    @IBOutlet weak var updateheight: UILabel!
    
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height=heightchanged.value
        let weight=weightChanged.value
        
        calculatorBrain.calculateBmi(height,weight)
        
        let BMI=weightChanged.value/( heightchanged.value*heightchanged.value)
        bmiValue=String(format: "%0.0f", BMI)
        print(BMI)
        self.performSegue(withIdentifier: "goToResult", sender: self)
//        let secondVC=SecondViewController()
//        secondVC.bmiValue=String(format: "%.1f",BMI)
//        self.present(secondVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult"{
            let destinationVC=segue.destination as! ResultViewController
            //destinationVC.bmi=bmiValue
            destinationVC.bmi=calculatorBrain.getBMIValue()
            destinationVC.advice=calculatorBrain.getAdvice()
            destinationVC.color=calculatorBrain.getColor()
        }
    }


}

