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

    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set container frame and add to the screen
        self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
        //self.view.addSubview(container)
        
        // set red square frame up
        // we want the blue square to have the same position as redSquare
        // so lets just reuse blueSquare.frame
        self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueSquare.frame = redSquare.frame
        
        // set background colors
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        // for now just add the redSquare
        // we'll add blueSquare as part of the transition animation
        //self.container.addSubview(self.redSquare)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateButtonPressed(sender: AnyObject) {
        // there are a lot of options for creating random numbers
        // in this example we'll use `drand48()` which creates a value between 0.0 and 1.0
        // but before we use it, we need to set a 'seed' otherwise the
        // values won't be random
        srand48(Int(NSDate().timeIntervalSince1970))
        
        // loop from 0 to 5
        for i in 0...5 {
            
            // create a square
            let square = UIView()
            square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
            square.backgroundColor = UIColor.redColor()
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomYOffset = CGFloat( drand48() * 150)
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16,y: 239 + randomYOffset))
            path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            //anim.duration = 5.0
            
            // each square will take between 4.0 and 8.0 seconds
            // to complete one animation loop
            anim.duration = 4.0 + 3 * drand48()
            
            // stagger each animation by a random value
            // `290` was chosen simply by experimentation
            anim.timeOffset = 290 * drand48()
            
            // add the animation 
            square.layer.addAnimation(anim, forKey: "animate position along path")
        }
        
    }

}

