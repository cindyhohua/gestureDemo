//
//  PanAndPinchViewController.swift
//  GestureDemo
//
//  Created by 賀華 on 2023/10/26.
//

import UIKit

class PanAndPinchViewController: UIViewController, UIGestureRecognizerDelegate {
    // img user interaction enable要記得打開
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //拖曳
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(panImage))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        img.addGestureRecognizer(panGesture)
        panGesture.delegate = self
        
        
        //縮放
        let pinchGesture = UIPinchGestureRecognizer(
            target: self,
            action: #selector(pinchImage))
        img.addGestureRecognizer(pinchGesture)
        pinchGesture.delegate = self
        
        
        //旋轉
        let rotateGesture = UIRotationGestureRecognizer(
            target: self,
            action: #selector(rotateImage))
        img.addGestureRecognizer(rotateGesture)
        rotateGesture.delegate = self
    }
    
    @objc func panImage(recogizer: UIPanGestureRecognizer) {
            let translation = recogizer.translation(in: self.view)
            if let view = recogizer.view {
                view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            }
        //重置偏移量
            recogizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func pinchImage(recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            //重置比例
            recognizer.scale = 1
        }
    }
    
    @objc func rotateImage(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            //重置旋轉量
            recognizer.rotation = 0
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
