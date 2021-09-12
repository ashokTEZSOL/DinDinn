//
//  AutoScrollImageView.swift
//  SparStore
//
//  Created by abhilash on 09/09/21.
//  Copyright © 2020 Komara Ashok. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class AutoScrollImageView : UIView {
	
	//MARK:- Private properties..
	private lazy var collectionView : UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = UIColor.clear
		cv.layer.zPosition = 0
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.layer.masksToBounds = true
		return cv
	}()
	private lazy var pageController : UIPageControl = {
		let pageC = UIPageControl()
		return pageC
	}()
	private var cellIdentifier = "imagesCell"
	private var timer : Timer?
	private var currentIndex : Int = 0 {
		didSet {
			self.updateData()
		}
	}
	
	//MARK:- Public access...
//	public var selectionCallback : selectedIndex?
	public var pageCHeigh : Int = 22
	public var timeRepete : Float = 8.0
	public var isApiDownload : Bool = false
	public var backColor : UIColor = UIColor.white
	public var imagesArray : [String] = [] {
		didSet {
			self.pageController.numberOfPages = imagesArray.count
			self.pageController.pageIndicatorTintColor = .lightGray
			self.pageController.currentPageIndicatorTintColor = .red
			self.currentIndex = 0
			if imagesArray.count > 0 {
				self.startTimer()
			}
			self.collectionView.reloadData()
		}
	}
	
	
	//MARK:- UI Setup
	public override func awakeFromNib() {
		self.setUpLayout()
	}
	
	func setUpLayout() {
		self.collectionView.backgroundColor = .clear
		self.backgroundColor = self.backColor
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		(self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
		self.collectionView.isPagingEnabled = true
		
		self.pageController.translatesAutoresizingMaskIntoConstraints = false
		self.collectionView.translatesAutoresizingMaskIntoConstraints = false
		self.collectionView.register(ImageCell.self, forCellWithReuseIdentifier: cellIdentifier)
		
		self.addSubview(self.collectionView)
		self.addSubview(self.pageController)
		
		
		let heightC : NSLayoutConstraint = NSLayoutConstraint(item: self.pageController, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: CGFloat(pageCHeigh))
		let leadingC = NSLayoutConstraint(item: self.pageController, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
		let buttomC = NSLayoutConstraint(item: self.pageController, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
		let trailC = NSLayoutConstraint(item: self.pageController, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
		
		let topCV = NSLayoutConstraint(item: self.collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
		let leadingCV = NSLayoutConstraint(item: self.collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
		let buttomCV = NSLayoutConstraint(item: self.collectionView, attribute: .bottom, relatedBy: .equal, toItem: self.pageController, attribute: .top, multiplier: 1, constant: 5)
		let trailCV = NSLayoutConstraint(item: self.collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
		
		self.addConstraints([heightC,leadingC,buttomC,trailC])
		self.addConstraints([topCV,leadingCV,buttomCV,trailCV])
	}
	
	private func updateData() {
		// added validation for crash in iPhone6
		// iOS 12...
		guard self.imagesArray.count > 0 else {return}
		if !(self.currentIndex < imagesArray.count) {
			self.currentIndex = 0
			self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
			self.pageController.currentPage = 0
			return
		}
		self.collectionView.scrollToItem(at: IndexPath(row: self.currentIndex, section: 0), at: .centeredHorizontally, animated: true)
		self.pageController.currentPage = self.currentIndex
	}
	
	// times will start once you assign images..
	private func startTimer() {
		if self.timer == nil {
			self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeRepete), target: self, selector: #selector(self.moveCell), userInfo: nil, repeats: true)
		}
	}
	
	@objc func moveCell() {
		self.currentIndex += 1
	}
	
	
}

//MARK:- CollectionView datasource methods...
extension AutoScrollImageView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imagesArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ImageCell else {return UICollectionViewCell()}
		
		if self.imagesArray.count > indexPath.row {
			if self.isApiDownload {
//				cell.displayImage.downloadApiImage(with: self.imagesArray[indexPath.row])
			} else {
				cell.displayImage.image = UIImage(named: self.imagesArray[indexPath.row])
			}
		}
		
		cell.displayImage.backgroundColor = self.backColor
		cell.backgroundColor = self.backColor
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		debugPrint("selected index")
//		self.selectionCallback?(indexPath.row)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (self.collectionView.bounds.width), height: (self.collectionView.bounds.height))
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		if let index = self.collectionView.indexPathsForVisibleItems.first {
			self.currentIndex = index.row
		}
	}
}

