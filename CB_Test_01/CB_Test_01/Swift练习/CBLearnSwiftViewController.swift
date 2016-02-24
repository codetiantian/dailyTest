//
//  CBLearnSwiftViewController.swift
//  CB_Test_01
//
//  Created by Elaine on 15--25.
//  Copyright © 2015年 yinuo. All rights reserved.
//

import UIKit

class CBLearnSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Swift"
        
//        self.myTestVarOrLet()
        
        self.myTestBlock()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func myTestVarOrLet() {
        let strCu : String? = "Hello"
        print(strCu == nil)
        
        let optionName: String? = nil
        var greeting = "hello!"
        if let name = optionName {
            greeting = "Hello, \(name)"
        }
        
        print(greeting)
    }
    
    
    func backwards(s1 : String, s2 : String) -> Bool {
        return s1 > s2
    }
    
    func myTestBlock() {
       let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        let myName = names.sort(backwards)
        print(myName)
    }

    
}
