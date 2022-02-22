//
//  PokeDetailViewController.swift
//  Pokedex
//
//  Created by M A Russel on 14/9/21.
//

import UIKit
import Kingfisher

final class PokeDetailViewController: BoundViewController<PokeDetailView, PokeDetailViewModel> {
    weak var coordinator: PokeDetailCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.isOpaque = false
        rootView.backgroundColor = .clear

        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        rootView.backgroundView.addGestureRecognizer(gesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.getPokeDetail(with: self.viewModel.name) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.rootView.slideView.animateSlide()
            }
        }
    }
    
    private func getPokeDetail(with name: String, onCompletion: @escaping ()-> Void) {
        viewModel.getPokeDetails(with: name) { [weak self] result in
            guard let self = self else { return }
            
            self.rootView.activityIndicatorView.isHidden = true
            
            switch result {
            case let .success(data):
                self.rootView.containerView.isHidden = false
                
                self.rootView.nameLabel.text = name
                self.rootView.heightLabel.text = "height: \(data.height)"
                self.rootView.widthLabel.text = "weight: \(data.weight)"

                guard let imageUrl = data.sprites.front_default else { return }
                self.rootView.imageView.kf.indicatorType = .activity
                self.rootView.imageView.kf.setImage(with: imageUrl)

            case .failure:
                Logger.log("Failed fetching data")
            }
            
            onCompletion()
        }
    }
    
    @objc
    func tapAction() {
        self.coordinator?.dissmiss()
    }
}
