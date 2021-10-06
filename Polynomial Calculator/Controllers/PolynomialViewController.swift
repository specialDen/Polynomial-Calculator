//
//  ViewController.swift
//  quadratic Calc
//
//  Created by Izuchukwu Dennis on 24/08/2019.
//  Copyright © 2019 Izuchukwu Dennis. All rights reserved.
//

import UIKit

class PolynomialViewController: UIViewController {
    
    @IBOutlet weak var A_Tfield: UITextField!
    @IBOutlet weak var B_Tfield: UITextField!
    @IBOutlet weak var C_Tfield: UITextField!
    @IBOutlet weak var D_Tfield: UITextField!
    @IBOutlet weak var E_Tfield: UITextField!
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        // Do any additional setup after loading the view.
    }
    //    @IBAction func value_inputs(_ sender: Any) {
    //    }
    @IBAction func SolveButton(_ sender: Any) {

        guard let A = A_Tfield.text == "" ? 0 : Double(A_Tfield.text ?? "0") else{
            
            return
        }
        guard let B = B_Tfield.text == "" ? 0 : Double(B_Tfield.text ?? "0") else{
            
            return
        }
        guard let C = C_Tfield.text == "" ? 0 : Double(C_Tfield.text ?? "0") else{
            
            return
        }
        guard let D = D_Tfield.text == "" ? 0 : Double(D_Tfield.text ?? "0") else{
            
            return
        }
        guard let E = E_Tfield.text == "" ? 0 : Double(E_Tfield.text ?? "0") else{
            //                 let alert = UIAlertController(title: "jvjjv", message: nil, preferredStyle: .alert)
            //                 present(alert, animated: true, completion: nil)
            return
        }
        
        
        //        ResultLabel.text  = "A = \(A_Tfield.text!) \nB = \(B_Tfield.text!) \nC = \(C_Tfield.text!) \nD = \(D_Tfield.text!) \nE = \(E_Tfield.text!)"
        
        
        //        guard let B = Double(B_Tfield.text ?? "0")else {
        //            return
        //        }
        //        guard let C = Double(C_Tfield.text ?? "0")else {
        //            return
        //        }
        //        guard let D = Double(D_Tfield.text ?? "0")else {
        //            return
        //        }
        //        guard let E = Double(E_Tfield.text ?? "0")else {
        //            return
        //        }
        //        let A = Double(A_Tfield.text!)!
        //        let B = Double(B_Tfield.text!)!
        //        let C = Double(C_Tfield.text!)!
        //        let D = Double(D_Tfield.text!)!
        //        let E = Double(E_Tfield.text!)!
        //        var A: Double?
        //
        
        //        if Double(A_Tfield.text!) != nil {
        //            A  =  Double(A_Tfield.text!) ?? 0
        //        } else {
        //            A_Tfield.text = "Number only"
        //            A = nil
        //        }
        
        
        if(A == 0){
            if(B == 0){
                if (C == 0){
                    if(D == 0){
                        ResultLabel.text = "No roots"
                    }
                    else{
                        ResultLabel.text = "X = \(-E / D) "
                    }
                }
                else {
                    ResultLabel.text = CalculatorBrain.solve.quadratic_eqn(C: C, D: D, E: E)
                }
            }
            else {
                ResultLabel.text = CalculatorBrain.solve.cubicroots((C/B),(D/B), (E/B))
            }
        }
        else{
            ResultLabel.text = CalculatorBrain.solve.quarticroots((B/A),(C/A),(D/A),a4: (E/A))
        }
        
    }
    
    @IBAction func ClearButton(_ sender: Any) {
        A_Tfield.text = ""
        B_Tfield.text = ""
        C_Tfield.text = ""
        D_Tfield.text = ""
        E_Tfield.text = ""
        ResultLabel.text = ""
    }
    
    private func configureTextFields() {
        A_Tfield.delegate = self
        B_Tfield.delegate = self
        C_Tfield.delegate = self
        D_Tfield.delegate = self
        E_Tfield.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        
    }
    
    
    
}

extension PolynomialViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
