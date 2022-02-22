//
//  PokeDetailView.swift
//  Pokedex
//
//  Created by M A Russel on 14/9/21.
//

import UIKit

final class PokeDetailView: BoundView<PokeDetailViewModel> {
    
    private(set) lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.25)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var slideView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        activityIndicatorView.transform = transform
        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private(set) lazy var containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var widthLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(backgroundView)
        addSubview(slideView)
        
        slideView.addSubview(activityIndicatorView)
        
        slideView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(heightLabel)
        containerView.addSubview(widthLabel)
        
        containerView.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        slideView.roundCorners(corners: [.topLeft, .topRight], radius: 15.0)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            slideView.leftAnchor.constraint(equalTo: leftAnchor),
            slideView.rightAnchor.constraint(equalTo: rightAnchor),
            slideView.heightAnchor.constraint(equalToConstant: 300),
            slideView.centerXAnchor.constraint(equalTo: centerXAnchor),
            slideView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 300)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: slideView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: slideView.centerYAnchor),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: slideView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: slideView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: slideView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: slideView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            heightLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            heightLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            widthLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 4),
            widthLabel.leftAnchor.constraint(equalTo: heightLabel.leftAnchor),
        ])
    }
    
    override func assignLocalizedTexts() {
        super.assignLocalizedTexts()
        
    }
}

extension UIView{
    func animateSlide(){
        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= 300
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
