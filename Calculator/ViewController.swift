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

}

