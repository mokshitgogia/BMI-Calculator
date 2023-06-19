//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Mokshit Gogia on 30/01/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    mutating func calculateBmi(_ height: Float,_ weight:Float){
        let bmiValue=weight/(height*height)
        if bmiValue<18.5{
            bmi=BMI(value: bmiValue, advice: "Eat more", color: UIColor.blue)
        }
        else if bmiValue<24.9
        {
            bmi=BMI(value: bmiValue, advice: "you are fit", color: UIColor.green)
        }
        else
        {
            bmi=BMI(value: bmiValue, advice: "eat less", color: UIColor.red)
        }
    }
    
    func getBMIValue()-> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getColor()->UIColor{
        return bmi?.color ?? UIColor.white
    }
    func getAdvice()->String{
        return bmi?.advice ?? "No advice"
    }
}
