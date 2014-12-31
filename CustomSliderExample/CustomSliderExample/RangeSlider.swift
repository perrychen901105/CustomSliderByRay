//
//  RangeSlider.swift
//  CustomSliderExample
//
//  Created by chenzhipeng on 14/12/31.
//  Copyright (c) 2014年 chenzhipeng. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSlider: UIControl {

    var minimumValue = 0.0
    var maximumValue = 1.0
    var lowerValue = 0.2
    var upperValue = 0.8
    
    let trackLayer = CALayer()
    let lowerThumbLayer = RangeSliderThumbLayer()
    let upperThumbLayer = RangeSliderThumbLayer()
    
    var previousLocation = CGPoint()
    
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.backgroundColor = UIColor.blueColor().CGColor
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.backgroundColor = UIColor.greenColor().CGColor
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.backgroundColor = UIColor.greenColor().CGColor
        layer.addSublayer(upperThumbLayer)
        
        lowerThumbLayer.rangeSlider = self
        upperThumbLayer.rangeSlider = self
        
        updateLayerFrames()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)
    }
    
    func updateLayerFrames() {
        trackLayer.frame = bounds.rectByInsetting(dx: 0.0, dy: bounds.height / 3)
        trackLayer.setNeedsLayout()
        
        let lowerThumbCenter = CGFloat(positionForValue(lowerValue))
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsLayout()
        
        let upperThumbCenter = CGFloat(positionForValue(upperValue))
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth);
        upperThumbLayer.setNeedsLayout()
    }
    
    /**
    maps a value to a location on screen using a simple ratio to scale the position between the minimum and maximum rage of the control.
    
    :param: value
    
    :returns:
    */
    func positionForValue(value: Double) -> Double {
        let widthDouble = Double(thumbWidth)
        return Double(bounds.width - thumbWidth) * (value - minimumValue) / (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }

    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    /**
    *  User Interaction
    */
    
    
    
}


