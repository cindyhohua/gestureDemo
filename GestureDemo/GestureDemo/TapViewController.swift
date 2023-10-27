//
//  ViewController.swift
//  GestureDemo
//
//  Created by 賀華 on 2023/10/26.
//

import UIKit

class TapViewController: UIViewController {
    @IBOutlet weak var twoOneView: UIView!
    @IBOutlet weak var oneTwoView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var oneoneView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 點一次 一隻手指
        let oneTapOneFingerGesture = UITapGestureRecognizer(
            target:self,
            action:#selector(oneTapOneFinger))
        oneTapOneFingerGesture.numberOfTapsRequired = 1
        oneTapOneFingerGesture.numberOfTouchesRequired = 1
        oneoneView.addGestureRecognizer(oneTapOneFingerGesture)
        
        // 點一次 兩隻手指
        let oneTapTwoFingerGesture = UITapGestureRecognizer(
            target:self,
            action:#selector(oneTapTwoFinger))
        oneTapTwoFingerGesture.numberOfTapsRequired = 1
        oneTapTwoFingerGesture.numberOfTouchesRequired = 2
        oneTwoView.addGestureRecognizer(oneTapTwoFingerGesture)
        
        // 點兩次 一隻手指
        let twoTapOneFingerGesture = UITapGestureRecognizer(
            target:self,
            action:#selector(twoTapOneFinger))
        twoTapOneFingerGesture.numberOfTapsRequired = 2
        twoTapOneFingerGesture.numberOfTouchesRequired = 1
        twoOneView.addGestureRecognizer(twoTapOneFingerGesture)
        
    }
    
    @objc func oneTapOneFinger() {
        label.text = "One tap with one finger"
    }
    
    @objc func oneTapTwoFinger() {
        label.text = "One tap with two finger"
    }
    
    @objc func twoTapOneFinger() {
        label.text = "Two tap with one finger"
    }
    
    
    
    
}

