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
        rangeSlider.backgroundColor = UIColor.redColor();
        view.addSubview(rangeSlider);
        // Do any additional setup after loading the view, typically from a nib.
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

