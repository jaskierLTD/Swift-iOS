//
//  GraphViewController.swift
//  Counter
//
//  Created by Oleksandr Zheliezniak on 27/12/2017.
//  Copyright © 2017 Oleksandr Zheliezniak. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController
{
    override func viewWillAppear(_ animated: Bool)
    {
        let context = UIGraphicsGetCurrentContext()
        context?.clear(self.view.bounds)
        
        let draw = DrawLines(frame: CGRect(x: self.view.bounds.origin.x+10, y: self.view.bounds.origin.y+10, width: self.view.bounds.width-20, height: self.view.bounds.height-40.0))
        view.addSubview(draw)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        if UIDevice.current.orientation.isLandscape
        {
            while let subview = self.view.subviews.last
            {   subview.removeFromSuperview()   }
            
            let draw = DrawLines(frame: CGRect(x: self.view.bounds.origin.y+10, y: self.view.bounds.origin.x+10, width: self.view.bounds.height-20, height: self.view.bounds.width-50.0))
            view.addSubview(draw)
        }
        
        else
        {
            while let subview = self.view.subviews.last
            {   subview.removeFromSuperview()   }
            let draw = DrawLines(frame: CGRect(x: self.view.bounds.origin.y+10, y: self.view.bounds.origin.x+10, width: self.view.bounds.height-20, height: self.view.bounds.width-50.0))
            view.addSubview(draw)
        }
    }
}

extension UITextView
{
    func graph()
    {
        self.textAlignment = NSTextAlignment.center
        self.textColor = UIColor.init(red: 0.00, green: 0.80, blue: 0.80, alpha: 1.00)
        self.backgroundColor = UIColor(white: 1, alpha: 0)
        self.font = UIFont(name: "Avenir Book" , size: 14.0)
        self.isEditable = false
        self.isSelectable = false
    }
}