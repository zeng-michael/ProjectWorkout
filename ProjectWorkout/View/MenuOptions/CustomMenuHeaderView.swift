//
//  CustomMenuHeaderView.swift
//  ProjectWorkout
//
//  Created by Michael Zeng on 10/13/18.
//  Copyright © 2018 Michael Zeng. All rights reserved.
//

import Foundation
import UIKit

class CustomMenuHeaderView: UIView {
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageView = ProfileImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupComponentProps()
        setupStackView()
    }
    
    fileprivate func setupComponentProps() {
        // custom components for our header
        nameLabel.attributedText = "More Options".convertToNSAtrributredString(size: 20, color: .black)
        usernameLabel.text = "More Options"
        statsLabel.text = ""
        profileImageView.image = UIImage(named: "male_arms")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .red
        
        setupStatsAttributedText()
    }
    
    fileprivate func setupStatsAttributedText() {
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: " ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
        attributedText.append(NSAttributedString(string: "  ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: " ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "", attributes: [.foregroundColor: UIColor.black]))
        
        statsLabel.attributedText = attributedText
    }
    
    fileprivate func setupStackView() {
        // this is a spacing hack with UIView
        let rightSpacerView = UIView()
        let arrangedSubviews = [
            //            UIView(),
            UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
            nameLabel
//            usernameLabel
//            SpacerView(space: 16),
//            statsLabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
