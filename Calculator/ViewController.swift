//
//  ViewController.swift
//  Calculator
//
//  Created by slashhuang's mac on 16/4/29.
//  Copyright © 2016年 slashhuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {//继承语法

    @IBOutlet weak var display: UILabel!//定义属性
    //属性必须初始化
    var userInTheMiddleOfTyping:Bool = false;
   // swift 是强类型语言
    // type ? optional有两个值，1个是not set(nil); 1个是类型推断
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle;
        if(userInTheMiddleOfTyping){
            display.text = display.text! + digit!;
            //crash if it is nil
        }else{
            display.text =  digit!;
            userInTheMiddleOfTyping = true;
        }
        
        print("digit is \(digit)")
        //it's a constant
    }
    var operateStack = Array<Double>();

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!;
        if(userInTheMiddleOfTyping){
            enterKey();
        }
        switch operation{
            case "×"://高级语法糖
                performOperate({(opt1:Double,opt2:Double)->Double in
                    return opt1*opt2;
                    })
                break;
            case "÷":
                performOperate({(opt1:Double,opt2:Double)->Double in
                    return opt1/opt2;
                })
                break;
            case "+":
                performOperate({(opt1:Double,opt2:Double)->Double in
                    return opt1 + opt2;
                })
                break;
             case "−":
                performOperate({(opt1:Double,opt2:Double)->Double in
                    return opt1 - opt2;
                })
                break;
            default:
                break;
        }
    }
    func performOperate(operation:(Double,Double)->Double){
        if(operateStack.count>=2){
            displayValue = operation(operateStack.removeLast(),operateStack.removeLast());
            enterKey();
        }
    }
    
    @IBAction func enterKey() {
        userInTheMiddleOfTyping=false;
        operateStack.append(displayValue);
        print("\(operateStack)");
    }
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        set{
            display.text="\(newValue)"
            userInTheMiddleOfTyping=false;
        }
    }
    
}

