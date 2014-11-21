//
//  ViewController.swift
//  PrototypeAnimation
//
//  Created by Arturo Murillo on 11/21/14.
//  Copyright (c) 2014 Arturo Murillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var objectLimitSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateButtonPressed(sender: AnyObject) {
        
        // loop for 10 times
        for loopNumber in 0...Int(self.objectLimitSlider.value) {
            // set size to be a random number between 20 and 60
            let size : CGFloat = CGFloat( Int(rand()) % 40 + 20)
            
            // set yPosition to be a random number between 20 and 220
            let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20)
            
            // create the square using these constants
            // in this example I've also used the Objective-C convention for making the CGRect
            // but I could have used CGRect(x:0, y:yPosition, width:size, height:size) like we've done previously - they are equivalent
            let coloredSquare = UIView()
            coloredSquare.backgroundColor = UIColor.blueColor()
            coloredSquare.frame = CGRectMake(0-size, yPosition, size, size)
            self.view.addSubview(coloredSquare)
            
            // set up some constants for the animation
            let duration = 1.0
            var delay =  NSTimeInterval(Int(rand()) %  900+100)/1000
            
            let options = UIViewAnimationOptions.CurveLinear
            
            // define the animation
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                coloredSquare.backgroundColor = UIColor.redColor()
                
                // again use the square constants size and yPosition
                coloredSquare.frame = CGRectMake(self.view.frame.width, yPosition, size, size)
                
                }, completion: { animationFinished in
                    
                    coloredSquare.removeFromSuperview()
                    
            })

        }
    }

}

