//
//  ViewController.swift
//  MediumCloneApp
//
//  Created by Alvin  on 10/03/2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var darkTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Shimmer"
        label.font = .systemFont(ofSize: 80)
        label.textAlignment = .center
        label.textColor = UIColor(white: 1, alpha: 1)
        return label
    }()
    
    lazy var shinyTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 80)
        label.textAlignment = .center
        label.text = "Shimmer"
       
        return label
    }()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        view.addSubview(shinyTextLabel)
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.repeatCount = Float.infinity
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinyTextLabel.frame
        
        let floatingAngle = 45 * CGFloat.pi/100
        gradientLayer.transform = CATransform3DMakeRotation(floatingAngle, 0, 0, 1)
        gradientLayer.add(animation, forKey: "Random Key")
        shinyTextLabel.layer.mask = gradientLayer
        
        
    }


}

