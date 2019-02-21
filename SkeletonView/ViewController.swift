//
//  ViewController.swift
//  SkeletonView
//
//  Created by Eugène Peschard on 21/02/2019.
//  Copyright © 2019 pesch.app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    var startLocations: [NSNumber] = [0.0, 0.5, 1.0]
    
    let skeletonView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.accessibilityLabel = "SkeletonView"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGradient()
    }
    
    // MARK: - Private
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(skeletonView)
        skeletonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            skeletonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            skeletonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skeletonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            skeletonView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = skeletonView.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [
            UIColor.darkGray.cgColor,
            UIColor.lightGray.cgColor,
            UIColor.darkGray.cgColor
        ]
        gradientLayer.locations = startLocations
        skeletonView.layer.addSublayer(gradientLayer)
    }

}
