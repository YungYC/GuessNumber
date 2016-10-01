//
//  ViewController.swift
//  guessNumber
//
//  Created by Duncan on 2016/2/13.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var answer = Int(arc4random_uniform(100) + 1)
    var minNumber = 1
    var maxNumber = 100
    var isOver = false
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var numberShow: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    @IBAction func goButton(sender: AnyObject) {
        if isOver == false{
            let inputAnswer = Int(inputNumber.text!)
            inputNumber.text = ""
            if inputAnswer == nil{
                hintLabel.text = "請輸入一個數字"
            }else if inputAnswer >= maxNumber || inputAnswer <= minNumber{
                hintLabel.text = "數字超過範圍"
            }else if inputAnswer == answer{
                hintLabel.text = "恭喜！你猜對了！按ＧＯ在玩一次"
                numberShow.text = "\(answer)"
                isOver = true
            }else{
                if inputAnswer > answer{
                    maxNumber = inputAnswer!
                    numberShow.text = "\(minNumber)-\(maxNumber)"
                }else{
                    minNumber = inputAnswer!
                    numberShow.text = "\(minNumber)-\(maxNumber)"
                }
                hintLabel.text = "請從範圍中猜一個數字"
            }
        }else{
            answer = Int(arc4random_uniform(100) + 1)
            minNumber = 1
            maxNumber = 100
            hintLabel.text = "請從1～100中猜一個數字"
            numberShow.text = "\(minNumber) - \(maxNumber)"
            print(answer)
            isOver = false
        }
        numberShow.textColor = UIColor(red:CGFloat((99.0 + Float(minNumber - maxNumber))/99.0), green:0, blue:0, alpha:1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(answer)
        inputNumber.becomeFirstResponder()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

