//
//  CBTestLayerViewController.swift
//  CB_Test_01
//
//  Created by Elaine on 15--14.
//  Copyright © 2015年 yinuo. All rights reserved.
//

import UIKit

class CBTestLayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CALayerTest"
        // Do any additional setup after loading the view.
        
        self.initMyShaperLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  MARK: - 初始化myLayer
    func initMyLayer() {
        let blueLayer = CALayer()
        blueLayer.frame = CGRectMake(100.0, 100.0, 100.0, 100.0)
//        blueLayer.backgroundColor = UIColor.blueColor().CGColor
        self.view.layer.addSublayer(blueLayer)
        
        //  添加背景图
        blueLayer.contents = UIImage(named: "yy_ico@3x")?.CGImage
    }
    
    
    func initMyShaperLayer() {
        
        let path = UIBezierPath.init(roundedRect: CGRectMake(100, 100, 100, 100), cornerRadius: 50)
        
        let myshaperLayer = CAShapeLayer()
        myshaperLayer.path = path.CGPath
//        myshaperLayer.strokeStart = 0
//        myshaperLayer.strokeEnd = 1
        myshaperLayer.fillColor = UIColor.clearColor().CGColor
        myshaperLayer.strokeColor = UIColor.blueColor().CGColor
        myshaperLayer.lineWidth = 10.0
        self.view.layer.addSublayer(myshaperLayer)
        
        let basicAni = CABasicAnimation.init(keyPath: "strokeEnd")
        basicAni.duration = 3.0
        basicAni.fromValue = 0
        basicAni.toValue = 0.8
            
        myshaperLayer.addAnimation(basicAni, forKey: nil)
        
        myshaperLayer.strokeEnd = 0.8
    }

}
