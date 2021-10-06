//
//  File.swift
//  quadratic Calc
//
//  Created by Izuchukwu Dennis on 28/09/2019.
//  Copyright © 2019 Izuchukwu Dennis. All rights reserved.
//

import Foundation

struct Complex {
    var real: Double = 0, imag : Double = 0
    
    init(_ r: Double, _ i: Double ) {
        self.real = r
        self.imag = i
    }
    
    init(_ r: Double){
        self.real = r
        self.imag = 0
    }
    init(){
        self.real = 0
        self.imag = 0
    }
}

func conjugate(_ no: Complex) -> Complex{
    return Complex(no.real, -1 * no.imag )
}


func pow(_ no: Complex ,_ powt: Double) -> Complex{
    let modulus = sqrt(no.real * no.real + no.imag * no.imag)
    let arg = atan2(no.imag, no.real)
    let res = Complex((pow(modulus, powt) * cos( arg * powt)), pow(modulus, powt) * sin(arg * powt))
    return (res)
    
}

//func root(_ no: complex ,_ powt: Double) -> complex{
//    let modulus = sqrt(no.real * no.real + no.imag * no.imag)
//    if (no.imag == 0 && no.real < 0){
//        let arg = (Double.pi + 2 * Double.pi)
//        let res = complex((pow(modulus, 1/powt) * cos( arg * 1/powt)), pow(modulus, 1/powt) * sin(arg * 1/powt))
//           return (res)
//    }
//    else {
//        let arg = (atan(no.imag / no.real) + 2 * Double.pi)
//        let res = complex((pow(modulus, 1/powt) * cos( arg * 1/powt)), pow(modulus, 1/powt) * sin(arg * 1/powt))
//           return (res)
//    }
//}

func root(_ no: Complex ,_ powt: Double = 2) -> [Complex]{
    let modulus = sqrt(no.real * no.real + no.imag * no.imag)
    var arg = [Double]()
    var res = [Complex]()
//    var somearray = [complex]()
    for i in 0...Int(powt-1) {
        arg += [(atan2(no.imag, no.real) + 2.0 * Double.pi * Double(i))/powt]
        res += [Complex((pow(modulus, 1.0/powt) * cos( arg[i])), pow(modulus, 1.0/powt) * sin(arg[i]))]
    }
    for item in res
    { print(item)
    }
    print ("Arg \(no.real) + \(no.imag) = \(arg)")
                  return (res)
//    }
}

func sqrt(_ no: Complex) -> Complex{
    let modulus = sqrt(no.real * no.real + no.imag * no.imag)
    if (no.imag < 0){
        return Complex(0, -pow(modulus, 0.5))}
    else {
        return Complex(pow(modulus, 0.5), 0)}
}

func cubrt(_ no: Complex) -> Complex{
    let modulus = pow(sqrt(no.real * no.real + no.imag * no.imag), 1/3)
    let arg1 = atan2(no.imag, no.real)
    if (arg1 == Double.pi){
        return Complex(modulus * cos((arg1 + 2 * Double.pi)/3), modulus * sin((arg1 + 2 * Double.pi)/3))
    }
    else if (arg1 == 0){
        return Complex(modulus * cos(0), 0)
    }
    else{
        return Complex(modulus * cos(arg1/3), modulus * sin(arg1/3))
    }
}

func display(_ no: Complex)-> String{
    if no.imag < 0 {
        return ("\(String(format: "%.5f", no.real)) - \(String(format: "%.5f", -1*no.imag))i")
    }
    else if no.imag == 0 {
        return ("\(String(format: "%.5f", no.real))")
    }
    else{
        return ("\(String(format: "%.5f", no.real)) + \(String(format: "%.5f", no.imag))i")
    }
}

extension Complex{
    //unary -
    static prefix func - (vector: Complex) -> Complex {
        return Complex(-vector.real,-vector.imag)
    }
    // +
    static func + (left: Complex, right: Complex) -> Complex {
        return Complex(left.real + right.real, left.imag + right.imag)
    }
    // -
    static func - (left: Complex, right: Complex) -> Complex {
        return Complex(left.real - right.real, left.imag - right.imag)
    }
    // *
    static func * (left: Complex, right: Complex) -> Complex {
        return Complex((left.real * right.real - left.imag * right.imag), (left.real * right.imag + left.imag * right.real))
    }
    static func / (left: Complex, right: Complex) -> Complex {
        let y = right * conjugate(right)
        return Complex((left * conjugate(right)).real / y.real , (left * conjugate(right)).imag / y.real)
    }
}


