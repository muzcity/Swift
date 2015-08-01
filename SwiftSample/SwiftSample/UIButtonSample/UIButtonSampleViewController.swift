//
//  UIButtonSampleViewController.swift
//  SwiftSample
//
//  Created by brinicle on 2015. 8. 1..
//  Copyright (c) 2015년 muzcity. All rights reserved.
//

import UIKit

class UIButtonSampleViewController: UIViewController {

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init(coder aDecoder: NSCoder) {
//	    fatalError("init(coder:) has not been implemented")
		super.init(coder: aDecoder)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = "UIButton"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBAction func click_firstButton(sender: UIButton!) {

		UIAlertView(title: "uibutton sample viewcontroller", message: "click", delegate: nil, cancelButtonTitle: "ok").show()
	}

}
