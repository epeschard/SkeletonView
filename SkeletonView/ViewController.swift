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
    
    let skeletonView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.accessibilityIdentifier = "skeletonView"
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
        view.addSubview(skeletonView)
        skeletonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            skeletonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            skeletonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            skeletonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            skeletonView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = skeletonView.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        skeletonView.layer.addSublayer(gradientLayer)
    }

}
