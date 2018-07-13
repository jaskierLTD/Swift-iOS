//
//  DrawLines.swift
//  Counter
//
//  Created by Oleksandr Zheliezniak on 27/12/2017.
//  Copyright © 2017 Oleksandr Zheliezniak. All rights reserved.
//
import UIKit

class DrawLines: UIView
{
    var timeFrame: String = ""
    var sixtyArray = Array(repeating: 0, count: 61)
    var twentyFourArray = Array(repeating: 0, count: 25)
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw( _ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        context?.clear(rect)
        context!.setLineWidth(2.0)
        context!.setStrokeColor(UIColor.lightGray.cgColor)
        let X = self.bounds.minX
        let Y = self.bounds.maxY
        let X0 = CGFloat(X + 30)
        let Y0 = CGFloat(Y - 20)
        let Xn = self.bounds.maxX
        let Yn = self.bounds.minY

        let textView = UITextView(frame: CGRect(x: self.bounds.width/2 - 150, y: self.bounds.height/2 - 15, width: 300.0, height: 30.0))
        let textTime = UITextView(frame: CGRect(x: self.bounds.width - 63, y: Y0 - 28, width: 62.0, height: 24.0))
        textTime.textAlignment = NSTextAlignment.right
        textTime.graph()
        textTime.textColor = UIColor.darkGray
        textTime.text = "Time"
        self.addSubview(textTime)
        
        timeFrame = UserDefaults.standard.object(forKey: "frameStatus") as! String
        switch timeFrame
        {
        case "seconds":
            // executable code < 60 sec
            sixtyArray = UserDefaults.standard.object(forKey: "sendSeconds") as! Array
            let maxValue: Int = sixtyArray.max()!
            let xPattern: CGFloat = (Xn - X0 - 10) / 6
            let yPattern: CGFloat = (Y0 - 10) / CGFloat(maxValue)
            textTime.text = "Time(s)"
            self.addSubview(textTime)
            
            for countStep in 0...maxValue
            {
                let step = CGFloat(countStep) * yPattern
                
                context!.setLineWidth(1.0)
                context!.setAlpha(0.5)
                context!.setStrokeColor(UIColor.darkGray.cgColor)
                context!.move(to: CGPoint   (x: X0,      y: Y0 - step))
                context!.addLine(to: CGPoint(x: Xn - 10, y: Y0 - step))
                context!.strokePath()
                if ( countStep > 0 )
                {
                    let textView = UITextView(frame: CGRect(x: X, y: Y0-step-18, width: 30.0, height: 24.0))
                    textView.graph()
                    textView.textAlignment = NSTextAlignment.right
                    textView.text = String(countStep)
                    if maxValue > 3
                    {
                        textView.font = UIFont(name: "Avenir Book" , size: 10.0)
                    }
                    self.addSubview(textView)
                    
                    context!.setStrokeColor(UIColor.lightGray.cgColor)
                    context!.setLineWidth(4.0)
                    
                    context!.move(to: CGPoint(x: X0, y: Y0 - step))
                    context!.addLine(to: CGPoint(x: X0-3, y: Y0 - step))
                    context!.strokePath()
                }
            }
            
            for countTime in 0...6
            {
                let step = CGFloat(countTime) * xPattern
                
                context!.setLineWidth(1.0)
                context!.setAlpha(0.5)
                context!.setStrokeColor(UIColor.darkGray.cgColor)
                context!.move(to: CGPoint   (x: X0 + step, y: Y0))
                context!.addLine(to: CGPoint(x: X0 + step, y: Yn + 10))
                context!.strokePath()
                if ( countTime > 0 )
                {
                    let textView = UITextView(frame: CGRect(x: X0+step-15, y: Y0-6, width: 30.0, height: 24.0))
                    textView.graph()
                    textView.text = String(countTime*10)
                    self.addSubview(textView)
                    
                    context!.setStrokeColor(UIColor.lightGray.cgColor)
                    context!.setLineWidth(4.0)
                    
                    context!.move(to: CGPoint(x: X0+step, y: Y0))
                    context!.addLine(to: CGPoint(x: X0+step, y: Y0+3))
                    context!.strokePath()
                }
            }
            
            context!.move(to: CGPoint(x: X0, y: Y0))
            for (index, element) in sixtyArray.enumerated()
            {
                context!.setAlpha(1.0)
                context!.setLineWidth(1.0)
                context!.setStrokeColor(UIColor.green.cgColor)
                context!.addLine(to: CGPoint(x: (X0 + CGFloat(index) * xPattern/10), y: (Y0 - CGFloat(element) * yPattern) ))
            }
            context!.strokePath()
            
        case "minutes":
            // executable code > 60 sec < 1 hour
            sixtyArray = UserDefaults.standard.object(forKey: "sendMinutes") as! Array
            let maxValue: Int = sixtyArray.max()!
            let xPattern: CGFloat = (Xn - X0 - 10) / 6
            let yPattern: CGFloat = (Y0 - 10) / CGFloat(maxValue)
            textTime.text = "Time(m)"
            self.addSubview(textTime)
            
            for countStep in 0...maxValue
            {
                let step = CGFloat(countStep) * yPattern
                
                context!.setLineWidth(1.0)
                context!.setAlpha(0.5)
                context!.setStrokeColor(UIColor.darkGray.cgColor)
                context!.move(to: CGPoint   (x: X0,      y: Y0 - step))
                context!.addLine(to: CGPoint(x: Xn - 10, y: Y0 - step))
                context!.strokePath()
                if ( countStep > 0 )
                {
                    let textView = UITextView(frame: CGRect(x: X, y: Y0-step-18, width: 30.0, height: 24.0))
                    textView.graph()
                    textView.textAlignment = NSTextAlignment.right
                    textView.text = String(countStep)
                    if maxValue > 99
                    {
                        textView.font = UIFont(name: "Avenir Book" , size: 10.0)
                    }
                    self.addSubview(textView)
                    
                    context!.setStrokeColor(UIColor.lightGray.cgColor)
                    context!.setLineWidth(4.0)
                    
                    context!.move(to: CGPoint(x: X0, y: Y0 - step))
                    context!.addLine(to: CGPoint(x: X0-3, y: Y0 - step))
                    context!.strokePath()
                }
            }
            
            for countTime in 0...6
            {
                let step = CGFloat(countTime) * xPattern
                
                context!.setLineWidth(1.0)
                context!.setAlpha(0.5)
                context!.setStrokeColor(UIColor.darkGray.cgColor)
                context!.move(to: CGPoint   (x: X0 + step, y: Y0))
                context!.addLine(to: CGPoint(x: X0 + step, y: Yn + 10))
                context!.strokePath()
                if ( countTime > 0 )
                {
                    let textView = UITextView(frame: CGRect(x: X0+step-15, y: Y0-6, width: 30.0, height: 24.0))
                    textView.graph()
                    textView.text = String(countTime*10)
                    self.addSubview(textView)
                    
                    context!.setStrokeColor(UIColor.lightGray.cgColor)
                    context!.setLineWidth(4.0)
                    
                    context!.move(to: CGPoint(x: X0+step, y: Y0))
                    context!.addLine(to: CGPoint(x: X0+step, y: Y0+3))
                    context!.strokePath()
                }
            }
            
            context!.move(to: CGPoint(x: X0, y: Y0))
            for (index, element) in sixtyArray.enumerated()
            {
                context!.setAlpha(1.0)
                context!.setLineWidth(1.0)
                context!.setStrokeColor(UIColor.green.cgColor)
                context!.addLine(to: CGPoint(x: (X0 + CGFloat(index) * xPattern/10), y: (Y0 - CGFloat(element) * yPattern) ))
            }
            context!.strokePath()
            
        case "hours":
            // executable code for hours graphic
            twentyFourArray = UserDefaults.standard.object(forKey: "sendHours") as! Array
            let maxValue: Int = twentyFourArray.max()!
            let xPattern: CGFloat = (Xn - X0 - 10) / 6
            let yPattern: CGFloat = (Y0 - 10) / CGFloat(maxValue)
            textTime.text = "Time(h)"
            self.addSubview(textTime)
            
            for countStep in 0...maxValue
            {
                let step = CGFloat(countStep) * yPattern
                
                context!.setLineWidth(1.0)
                context!.setAlpha(0.5)
                context!.setStrokeColor(UIColor.darkGray.cgColor)
                context!.move(to: CGPoint   (x: X0,      y: Y0 - step))
                context!.addLine(to: CGPoint(x: Xn - 10, y: Y0 - step))
                context!.strokePath()
                if ( countStep > 0 )
                {
                    let textView = UITextView(frame: CGRect(x: X, y: Y0-step-18, width: 30.0, height: 24.0))
                    textView.graph()
                    textView.textAlignment = NSTextAlignment.right
                    textView.text = String(countStep)
                        if maxValue > 99
                        {
                            textView.font = UIFont(name: "Avenir Book" , size: 10.0)
                        }
                    self.addSubview(textView)
                    
                    context!.setStrokeColor(UIColor.lightGray.cgColor)
                    context!.setLineWidth(4.0)
                    context!.move(to: CGPoint(x: X0, y: Y0 - step))
                    context!.addLine(to: CGPoint(x: X0-3, y: Y0 - step))
                    context!.strokePath()
                }
            }
            
            for countTime in 0...6
            {
                let step = CGFloat(countTime) * xPattern
                
                context!.setLineWidth(1.0)
                context!.setAlpha(0.5)
                context!.setStrokeColor(UIColor.darkGray.cgColor)
                context!.move(to: CGPoint   (x: X0 + step, y: Y0))
                context!.addLine(to: CGPoint(x: X0 + step, y: Yn + 10))
                context!.strokePath()
                if ( countTime > 0 )
                {
                    let textView = UITextView(frame: CGRect(x: X0+step-15, y: Y0-6, width: 30.0, height: 24.0))
                    textView.graph()
                    textView.text = String(countTime*4)
                    self.addSubview(textView)
                    
                    context!.setStrokeColor(UIColor.lightGray.cgColor)
                    context!.setLineWidth(4.0)
                    
                    context!.move(to: CGPoint(x: X0+step, y: Y0))
                    context!.addLine(to: CGPoint(x: X0+step, y: Y0+3))
                    context!.strokePath()
                }
            }
            
            context!.move(to: CGPoint(x: X0, y: Y0))
            for (index, element) in twentyFourArray.enumerated()
            {
                context!.setAlpha(1.0)
                context!.setLineWidth(1.0)
                context!.setStrokeColor(UIColor.green.cgColor)
                context!.addLine(to: CGPoint(x: (X0 + CGFloat(index) * xPattern/4), y: (Y0 - CGFloat(element) * yPattern) ))
            }
            context!.strokePath()
            
        default:
            // executable code for 0 value
            textView.text = "To see the GRAPH, start to COUNT"
            textView.textColor = UIColor.darkGray
            textView.graph()
            self.addSubview(textView)
        }
        
        //axis
        context!.setStrokeColor(UIColor.lightGray.cgColor)
        context!.setLineWidth(2.0)
        
        context!.move(to: CGPoint(x: X0, y: Y0 + 20))
        context!.addLine(to: CGPoint(x: X0, y: Yn))
        context!.strokePath()
        
        context!.move(to: CGPoint(x: X0 - 20, y: Y0))
        context!.addLine(to: CGPoint(x: Xn, y: Y0))
        context!.strokePath()
    }
}
