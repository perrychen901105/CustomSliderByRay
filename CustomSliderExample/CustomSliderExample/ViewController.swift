//
//  ViewController.swift
//  CustomSliderExample
//
//  Created by chenzhipeng on 14/12/31.
//  Copyright (c) 2014年 chenzhipeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let rangeSlider = RangeSlider(frame: CGRectZero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rangeSlider);
        rangeSlider.addTarget(self, action: "rangeSliderValueChanged:", forControlEvents: .ValueChanged)

        //!!!: for test
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.rangeSlider.trackHighlightTintColor = UIColor.redColor()
            self.rangeSlider.curvaceousness = 0.0
        }
    }
    
    func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        println("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
    }

    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + topLayoutGuide.length, width: width, height: 31.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

