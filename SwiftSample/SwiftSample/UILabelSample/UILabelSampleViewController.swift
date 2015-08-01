//
//  UILabelSampleViewController.swift
//  SwiftSample
//
//  Created by muzcity on 2015. 7. 11..
//  Copyright (c) 2015년 muzcity. All rights reserved.
//

import UIKit

class UILabelSampleViewController: UIViewController {

	override func loadView() {
		super.loadView()
		
		self.view.backgroundColor = UIColor.orangeColor()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.title = "UILabel"
		
		var label : UILabel = UILabel.new()
		
		self.view.addSubview(label)
		
		label.backgroundColor = UIColor.redColor()
		label.textAlignment = NSTextAlignment.Center
		label.text = "center align"
		
		label.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label]))
		self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label(40)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label]))
		
		
		
		var prevLabel = label
		label = UILabel.new()
		
		self.view.addSubview(label)
		
		label.backgroundColor = UIColor.orangeColor()
		label.textAlignment = NSTextAlignment.Right
		label.text = "text\nalign right"
		label.highlighted = false
		label.highlightedTextColor = UIColor.whiteColor()
		label.numberOfLines = 2
		label.font = UIFont.systemFontOfSize(10)
		
		label.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label]))
		self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[prevLabel][label(40)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label, "prevLabel":prevLabel]))
		
		
		
		//NSForegroundColorAttributeName : color
		var attributedText = NSMutableAttributedString(string: "text attribute")
		attributedText.addAttribute(NSForegroundColorAttributeName, value:UIColor.redColor(), range: NSMakeRange(0, 4));
		
		
		prevLabel = label
		label = UILabel()
		
		self.view.addSubview(label)
		
		label.backgroundColor = UIColor.yellowColor()
		label.textAlignment = NSTextAlignment.Left
		label.attributedText = attributedText
		label.highlighted = false
		label.highlightedTextColor = UIColor.whiteColor()
		
		label.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label]))
		self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[prevLabel][label(40)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label, "prevLabel":prevLabel]))
		
		
		
		
		
		attributedText = NSMutableAttributedString(string: "text marquee")
		attributedText.addAttribute(NSForegroundColorAttributeName, value:UIColor.redColor(), range: NSMakeRange(0, 4));
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}
