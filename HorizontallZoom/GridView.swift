//
//  GridView.swift
//  HorizontallScroll
//
//  Created by Andrew Madsen on 2/5/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import UIKit

class GridView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.contentMode = .Redraw
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		self.contentMode = .Redraw
	}
	
	override func intrinsicContentSize() -> CGSize {
		return CGSize(width: 2.0 * barWidth * CGFloat(numberOfColumns), height: UIViewNoIntrinsicMetric)
	}
	
	override var transform: CGAffineTransform {
		get { return super.transform }
		set {
			var t = newValue
			t.d = 1.0
			super.transform = t
		}
	}
	
	override func drawRect(rect: CGRect) {
		
		UIColor(hue:0.530, saturation:0.261, brightness:1.000, alpha:1.000).set()
		UIBezierPath(rect: self.bounds).fill()
		
		var columns = [[CGRect]]()
		for c in 0..<numberOfColumns {
			let x = self.bounds.minX + CGFloat(c) * barWidth * 2.0
			var column = [CGRect]()
			for y in self.bounds.minY.stride(to: self.bounds.maxY, by: barWidth*2) {
				let rect = CGRect(x: x, y: y, width: barWidth, height: barWidth)
				column.append(rect)
			}
			columns.append(column)
		}
		
		let rects = Array(columns.flatten())
		UIColor.lightGrayColor().set()
		CGContextFillRects(UIGraphicsGetCurrentContext(), rects, rects.count)
	}
	
	let barWidth = CGFloat(10.0)
	
	var numberOfColumns = 50 {
		didSet {
			invalidateIntrinsicContentSize()
			setNeedsDisplay()
		}
	}
}
