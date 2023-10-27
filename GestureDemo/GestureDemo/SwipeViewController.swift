//
//  SwipeViewController.swift
//  GestureDemo
//
//  Created by 賀華 on 2023/10/26.
//

import UIKit
class SwipeViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let directions: [UISwipeGestureRecognizer.Direction] = [.up , .down, .left, .right]
        for direction in directions {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipGesture))
            swipeGesture.direction = direction
            img.addGestureRecognizer(swipeGesture)
        }
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(actionLongPress))
        longPress.minimumPressDuration = 0.5
        img.addGestureRecognizer(longPress)
    }
    
    @objc func actionSwipGesture(recoginizer: UISwipeGestureRecognizer) {
        switch recoginizer.direction {
        case .up:
            print("Swipe up")
            img.image = UIImage(named: "哈特利1")
        case .down:
            print("Swipe Down")
            img.image = UIImage(named: "哈特利2")
        case .left:
            print("Swipe Left")
            img.image = UIImage(named: "哈特利3")
        case .right:
            print("Swipe Right")
            img.image = UIImage(named: "哈特利4")
        default:
            print("Default")
        }
    }
    
    @objc func actionLongPress(Recognizer: UILongPressGestureRecognizer) {
        if Recognizer.state == .began {
            img.image = UIImage(named: "煙卷")
        } else if Recognizer.state == .ended {
            img.image = UIImage(named: "哈特利")
        }
    }
}
