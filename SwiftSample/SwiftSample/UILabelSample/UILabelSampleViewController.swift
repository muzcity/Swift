//
//  UILabelSampleViewController.swift
//  SwiftSample
//
//  Created by muzcity on 2015. 7. 11..
//  Copyright (c) 2015년 muzcity. All rights reserved.
//

import UIKit

class UILabelSampleViewController: UIViewController {

    deinit {
        println("UILabelSampleViewController deinit")
    }
    
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
		
        
        
        
        var infinityLabel : MZInfinityVerticalLabel = MZInfinityVerticalLabel()
        self.view.addSubview(infinityLabel)
        
        prevLabel = label
        
        infinityLabel.backgroundColor = UIColor.greenColor()
        
        //for frame set.
//        infinityLabel.frame = CGRectMake(0, 200, 375, 40)

        //for autolayout set.
        infinityLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : infinityLabel]))
        self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[prevLabel][label]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : infinityLabel, "prevLabel":prevLabel]))
        
        var contraintForLabelHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[label(40)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label":infinityLabel])
        
        self.view.addConstraint(contraintForLabelHeight[0] as! NSLayoutConstraint)
        
        //높이를 설정을 한 constraint를 넘겨줘서 설정하도록 한다.
        infinityLabel.weakConstraintForHeight = contraintForLabelHeight[0] as? NSLayoutConstraint
        
        infinityLabel.text = "abcde"
        
        //일정시간이 지나서 사용자가 텍스트를 변경했다 친다.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0*Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            infinityLabel.text = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리\n화려강산 대한사람 대한으로 길이보전하세"
        }
        
        
        
        
        
        
        label = UILabel.new()
        
        self.view.addSubview(label)
        
        label.backgroundColor = UIColor.blueColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = "center align"
        
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label]))
        self.view .addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[infinityLabel][label(40)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["label" : label, "infinityLabel":infinityLabel]))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}
