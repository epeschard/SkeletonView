//
//  ViewController.swift
//  SkeletonView
//
//  Created by Eugène Peschard on 21/02/2019.
//  Copyright © 2019 pesch.app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardView: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = 14.0
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        card.layer.shadowRadius = 6.0
        card.layer.shadowOpacity = 0.6
        card.accessibilityLabel = "Card"
        return card
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityLabel = "NameLabel"
        return label
    }()
    
    let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityLabel = "JobTitleLabel"
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.accessibilityLabel = "LocationLabel"
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.accessibilityLabel = "ProfileImageView"
        return imageView
    }()
    
    let nameMask: UIView = {
        let mask = UIView()
        mask.accessibilityLabel = "NameLabelMask"
        return mask
    }()
    
    let jobTitleMask: UIView = {
        let mask = UIView()
        mask.accessibilityLabel = "JobTitleLabelMask"
        return mask
    }()
    
    let locationMask: UIView = {
        let mask = UIView()
        mask.accessibilityLabel = "LocationLabelMask"
        return mask
    }()
    
    let profileImageMask: UIView = {
        let mask = UIView()
        mask.layer.masksToBounds = true
        mask.layer.cornerRadius = 25
        mask.accessibilityLabel = "ProfileImageMask"
        return mask
    }()
    
    var maskingViews: [UIView]!
    
    let skeletonView: SkeletonView = {
        let view = SkeletonView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14.0
        view.clipsToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        skeletonView.setMaskingViews(maskingViews)
        skeletonView.startAnimating()
        loadProfile()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        skeletonView.stopAnimating()
    }
    
    // MARK: - Private
    
    private func setup() {
        setupViews()
        setupLabels()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.init(white: 0.91, alpha: 1.0)
        
        view.addSubview(cardView)
        
        view.addSubview(skeletonView)
        skeletonView.addSubview(nameMask)
        skeletonView.addSubview(jobTitleMask)
        skeletonView.addSubview(locationMask)
        skeletonView.addSubview(profileImageMask)
        
        cardView.addSubview(nameLabel)
        cardView.addSubview(jobTitleLabel)
        cardView.addSubview(locationLabel)
        cardView.addSubview(profileImageView)

        cardView.translatesAutoresizingMaskIntoConstraints = false
        nameMask.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        jobTitleMask.translatesAutoresizingMaskIntoConstraints = false
        jobTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        locationMask.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageMask.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        skeletonView.translatesAutoresizingMaskIntoConstraints = false
        
        maskingViews = [profileImageMask, nameMask, jobTitleMask, locationMask]
        
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 100),
            
            profileImageMask.topAnchor.constraint(equalTo: skeletonView.topAnchor, constant: 8),
            profileImageMask.leadingAnchor.constraint(equalTo: skeletonView.leadingAnchor, constant: 8),
            profileImageMask.heightAnchor.constraint(equalToConstant: 50),
            profileImageMask.widthAnchor.constraint(equalToConstant: 50),
            
            nameMask.topAnchor.constraint(equalTo: skeletonView.topAnchor, constant: 15),
            nameMask.leadingAnchor.constraint(equalTo: profileImageMask.trailingAnchor, constant: 8),
            nameMask.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -50),
            nameMask.heightAnchor.constraint(equalToConstant: 10),
            
            jobTitleMask.topAnchor.constraint(equalTo: nameMask.bottomAnchor, constant: 15),
            jobTitleMask.leadingAnchor.constraint(equalTo: nameMask.leadingAnchor),
            jobTitleMask.trailingAnchor.constraint(equalTo: skeletonView.trailingAnchor, constant: -32),
            jobTitleMask.heightAnchor.constraint(equalToConstant: 10),
            
            locationMask.topAnchor.constraint(equalTo: jobTitleMask.bottomAnchor, constant: 15),
            locationMask.leadingAnchor.constraint(equalTo: nameMask.leadingAnchor),
            locationMask.trailingAnchor.constraint(equalTo: skeletonView.trailingAnchor, constant: -48),
            locationMask.heightAnchor.constraint(equalToConstant: 10),
            
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            
            jobTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            jobTitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            jobTitleLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            skeletonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            skeletonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skeletonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            skeletonView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setupLabels() {
        nameLabel.alpha = 0.0
        jobTitleLabel.alpha = 0.0
        locationLabel.alpha = 0.0
    }
    
    private func loadProfile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            //Set text to labels
            self.nameLabel.text = "Eugene Peschard"
            self.jobTitleLabel.text = "iOS Software Engineer"
            self.locationLabel.text = "Barcelona, Spain"
            
            self.skeletonView.stopAnimating()
            self.skeletonView.layer.mask = nil
            
            //Animate content fade in
            UIView.animate(withDuration: 0.6, animations: {
                self.nameLabel.alpha = 1.0
                self.jobTitleLabel.alpha = 1.0
                self.locationLabel.alpha = 1.0
                self.profileImageView.image = #imageLiteral(resourceName: "profile.jpg")
            })
        }
    }

}
