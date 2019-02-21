//
//  UIView+Extension.swift
//  SkeletonView
//
//  Created by Eugène Peschard on 21/02/2019.
//  Copyright © 2019 pesch.app. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Apply given views as masks
    ///
    /// - Parameter views: Views to apply as mask.
    /// ## Note: The view calling this function must have all the views in the given array as subviews.
    func setMaskingViews(_ views:[UIView]){
        
        let mutablePath = CGMutablePath()
        
        //Append path for each subview
        views.forEach { (view) in
            guard subviews.contains(view) else {
                fatalError("View:\(view) is not a subView of \(self). Therefore, it cannot be a masking view.")
            }
            //Check if ellipse
            if view.layer.cornerRadius == view.frame.size.height / 2, view.layer.masksToBounds{
                //Ellipse
                mutablePath.addEllipse(in: view.frame)
            }else{
                //Rect
                mutablePath.addRect(view.frame)
            }
        }
        
        //Create layer
        let layerMask = CAShapeLayer()
        layerMask.path = mutablePath
        
        //Apply layer as a mask
        self.layer.mask = layerMask
    }
}
