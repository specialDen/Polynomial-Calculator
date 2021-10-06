//
//  Calculator Brain.swift
//  quadratic Calc
//
//  Created by Izuchukwu Dennis on 23.08.2020.
//  Copyright © 2020 Izuchukwu Dennis. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    static let solve = CalculatorBrain()
    
    private init() { }

    func quadratic_eqn(C: Double, D: Double, E: Double) -> String? {
        let discr = Complex(pow(D, 2.0) - 4.0 * C * E)
        
        let x1 = ((-Complex(D) + pow(discr,0.5) ) / (Complex(2.0) * Complex(C)))
        let x2 = ((-Complex(D) - pow(discr,0.5) ) / (Complex(2.0) * Complex(C)))
        return (" X1 = \(display(x1)) \nX2 = \(display(x2)) ")
        
    }
    
    func cubicroots(_ a1: Double, _ a2: Double, _ a3: Double) -> String? {
        let Q = (3 * a2 - (a1*a1)) / 9
        let R = (9 * a1 * a2 - 27 * a3 - 2 * pow(a1,3)) / 54
        let S = cubrt(Complex(R) + pow(Complex(pow(Q, 3) + pow(R, 2)), 0.5))
        let T = cubrt(Complex(R) - pow(Complex(pow(Q, 3) + pow(R, 2)), 0.5))
        let x1 = S + T - Complex(a1 / 3)
        let x2 = (-(S + T) - Complex(2 * a1 / 3) + Complex(0,sqrt(3)) * (S-T)) / Complex(2)
        let x3 = (-(S + T) - Complex(2 * a1 / 3) - Complex(0,sqrt(3)) * (S-T)) / Complex(2)
        return ( " X1 = \(display(x1)) \nX2 = \(display(x2)) \nX3 = \(display(x3)) ")
    }
    
    func quarticroots(_ a1: Double, _ a2: Double, _ a3: Double, a4: Double) -> String? {
        let D_0 = a2*a2 - 3*a1*a3 + 12*a4
        let D_1 = 2*pow(a2,3) - 9*a1*a2*a3 + 27*(a1*a1)*a4 + 27*(a3*a3) - 72*a2*a4
        _ = (4*pow(D_0,3) - pow(D_1,2)) / 27
        let p = (8*a2 - 3*(a1*a1)) / 8
        let q = (pow(a1,3) - 4*a1*a2 + 8*a3) / 8
        let Q = cubrt((Complex(D_1) + pow( Complex((D_1*D_1) - 4*pow(D_0,3)),0.5 ))/Complex(2))
        let S = pow( (Complex(-(2*p)/3) + (Q + Complex(D_0)/Q) / Complex(3)),0.5) / Complex(2)
        let x1 = Complex(-a1/4) - S + Complex(0.5) * pow(( Complex(-4)*S*S - Complex(2*p) + Complex(q)/S),0.5)
        let x2 = Complex(-a1/4) - S - Complex(0.5) * pow(( Complex(-4)*S*S - Complex(2*p) + Complex(q)/S),0.5)
        let x3 = Complex(-a1/4) + S + Complex(0.5) * pow(( Complex(-4)*S*S - Complex(2*p) - Complex(q)/S),0.5)
        let x4 = Complex(-a1/4) + S - Complex(0.5) * pow(( Complex(-4)*S*S - Complex(2*p) - Complex(q)/S),0.5)
        return ( " X1 = \(display(x1)) \nX2 = \(display(x2)) \nX3 = \(display(x3)) \nX4 = \(display(x4)) ")
    }
}
