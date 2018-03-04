//
//  ViewController.swift
//  RBGCDSerialQueueTest
//
//  Created by pranav on 04/03/18.
//  Copyright © 2018 RB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView1: UIProgressView!
    @IBOutlet weak var progressView2: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView1.progress = 0.0
        progressView2.progress = 0.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addbuttonTouched(_ sender: Any) {
        progressView1.progress = 0.0
        progressView2.progress = 0.0
        
        //*****************************DISPATCH ON MAIN QUEUE******************************
        //Here we dispatch on main queue.
        //1. In progress1 and progress2 we update progress of progressView1 and progressView2 Respectively.
        //We do this by sleeping for 1 second after every update. The setting of progress on ProgressView causes the
        //setNeedsDisplay() to be called. When this is called ProgressView UI will be updated in the next iteration
        //of run loop. Now we do this for 10 seconds and we never give chance to the UI to update in run loop until 10 + 10 seconds. At the end of 10 + 10 seconds UI gets chance to update and is updated as we see progress
        //is 100%. Also UI is frozen for 10 + 10 Seconds.
//        let progress1 = {
//            for i in 1...10 {
//                print("self.progressView1.progress = \(Float(i)/Float(10))")
//                self.progressView1.progress = Float(i)/Float(10)
//                sleep(1)
//            }
//        }
//
//        let progress2 = {
//            for i in 1...10 {
//                print("self.progressView2.progress = \(Float(i)/Float(10))")
//                self.progressView2.progress = Float(i)/Float(10)
//                sleep(1)
//            }
//        }
//        DispatchQueue.main.async(execute: progress1)
//        DispatchQueue.main.async(execute: progress2)
        
        //*****************************DISPATCH ON CUSTOM SERIAL QUEUE******************************
        //Here we do a minor change. We dispatch on custom serial queue and update ui on main queue
        //1. Here we are able to update the view successfully as we give the ui a chance to update.
        //We can see how serial queue works as progress1 finishes and then progress2 starts
        //We also dont freeze the UI here
//        let progress1 = {
//            for i in 1...10 {
//                print("self.progressView1.progress = \(Float(i)/Float(10))")
//                DispatchQueue.main.async(execute: {
//                    self.progressView1.progress = Float(i)/Float(10)
//                })
//
//                sleep(1)
//            }
//        }
//
//        let progress2 = {
//            for i in 1...10 {
//                print("self.progressView2.progress = \(Float(i)/Float(10))")
//                DispatchQueue.main.async {
//                    self.progressView2.progress = Float(i)/Float(10)
//                }
//                sleep(1)
//            }
//        }
//        let queue = DispatchQueue(label: "com.RB.SerialTest")
//        queue.async(execute: progress1)
//        queue.async(execute: progress2)
        
        //*****************************DISPATCH ON CUSTOM CONCURRENT QUEUE******************************
        //Here we do a minor change. We dispatch on custom serial queue and update ui on main queue
        //1. Here we are able to update the view successfully as we give the ui a chance to update.
        //We can see how concurrent queue works as progress1 and progress2 are being process concurrently.
        //We also dont freeze the UI here
        let progress1 = {
            for i in 1...10 {
                print("self.progressView1.progress = \(Float(i)/Float(10))")
                DispatchQueue.main.async(execute: {
                    self.progressView1.progress = Float(i)/Float(10)
                })
                
                sleep(1)
            }
        }
        
        let progress2 = {
            for i in 1...10 {
                print("self.progressView2.progress = \(Float(i)/Float(10))")
                DispatchQueue.main.async {
                    self.progressView2.progress = Float(i)/Float(10)
                }
                sleep(1)
            }
        }
        let queue = DispatchQueue(label: "com.RB.ConcurrentTest", attributes: .concurrent)
        queue.async(execute: progress1)
        queue.async(execute: progress2)

    }
    
}

