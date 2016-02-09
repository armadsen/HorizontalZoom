//
//  ViewController.swift
//  HorizontallScroll
//
//  Created by Andrew Madsen on 2/5/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let textField = self.textField {
			textField.text = String(gridView.numberOfColumns)
		}
	}
	
	func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
		return self.gridView
	}
	
	func scrollViewDidZoom(scrollView: UIScrollView) {
		//gridView.translatesAutoresizingMaskIntoConstraints = true
		scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: scrollView.frame.height)
		scrollView.contentOffset = CGPoint(x: scrollView.contentOffset.x, y: 0.0)
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		
		if let text = textField.text,
			number = Int(text) {
				gridView.numberOfColumns = number
		}
		
		return true
	}
	
	@IBOutlet var gridView: GridView!
	@IBOutlet var textField: UITextField?
}

