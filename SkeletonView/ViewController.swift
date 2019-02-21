//
//  ViewController.swift
//  SkeletonView
//
//  Created by Eugène Peschard on 21/02/2019.
//  Copyright © 2019 pesch.app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let skeletonView: SkeletonView = {
        let view = SkeletonView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        skeletonView.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        skeletonView.stopAnimating()
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

}
