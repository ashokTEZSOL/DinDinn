//
//  ImageCell.swift
//  SparStore
//
//  Created by apple on 09/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
	
	
	let displayImage : UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .white
		imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
	}()
	
	override init(frame: CGRect) {
        super.init(frame: frame)
		self.updateImage()
    }
	
	func updateImage() {
		self.contentView.addSubview(displayImage)
		
		let topCV = NSLayoutConstraint(item: self.displayImage, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0)
		let leadingCV = NSLayoutConstraint(item: self.displayImage, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 0)
		let buttomCV = NSLayoutConstraint(item: self.displayImage, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0)
		let trailCV = NSLayoutConstraint(item: self.displayImage, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 0)
		self.contentView.addConstraints([topCV,leadingCV,buttomCV,trailCV])
	}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
