//
//  SkeletonView.swift
//  SkeletonView
//
//  Created by Eugène Peschard on 21/02/2019.
//  Copyright © 2019 pesch.app. All rights reserved.
//

import UIKit

class SkeletonView: UIView {
    
    var startLocations: [NSNumber] = [-1.0,-0.5, 0.0]
    var endLocations: [NSNumber] = [1.0,1.5, 2.0]
    
    var animationDuration: CFTimeInterval = 0.8
    var delay: CFTimeInterval = 1.0
    
    
    lazy var gradientLayer : CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [
            Skeleton.Gradient.background,
            Skeleton.Gradient.shine,
            Skeleton.Gradient.background
        ]
        gradientLayer.locations = self.startLocations
        self.layer.addSublayer(gradientLayer)
        return gradientLayer
    }()
    
    
    func startAnimating(){
        let animation = CABasicAnimation(keyPath: Skeleton.Gradient.Animation.keyPath)
        animation.fromValue = startLocations
        animation.toValue = endLocations
        animation.duration = animationDuration
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = animationDuration + delay
        animationGroup.animations = [animation]
        animationGroup.repeatCount = .infinity
        self.gradientLayer.add(animationGroup, forKey: animation.keyPath)
    }
    
    func stopAnimating() {
        self.gradientLayer.removeAllAnimations()
    }
    
}

enum Skeleton {
    static let accessibilityLabel = "SkeletonView"
    enum Gradient {
        static let background = UIColor(white: 0.85, alpha: 1.0).cgColor
        static let shine = UIColor(white: 0.75, alpha: 1.0).cgColor
        enum Animation {
            static let keyPath = "locations"
        }
    }
}
