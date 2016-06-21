//
//  MZInfinityVerticalLabel.swift
//  SwiftSample
//
//  Created by WONJUN KI on 2015. 8. 2..
//  Copyright (c) 2015년 muzcity. All rights reserved.
//

import UIKit

/*!
* 입력된 글자 높이에 맞게 label을 늘려주도록 autolayout설정  weak로 변수를 받아서 refCnt에 영향이 없게 처리함.
* weakConstrantForHeight가 비었다면 autolayout설정을 알수 없으므로 frame 설정하도록 처리됨.
*/

class MZInfinityVerticalLabel: UILabel {
    
    var labelHeight : CGFloat = 0
    var Padding : CGFloat = 5
    
    weak var weakConstraintForHeight : NSLayoutConstraint?
    
    convenience init(contentHeight height:CGFloat)
    {
        self.init(frame:CGRectZero)
        
        self.labelHeight = height
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.labelHeight = 0
        
        self.numberOfLines = -1
    }

    private var myContent = 0
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.labelHeight = frame.size.height
        
        self.numberOfLines = -1
        
        self.addObserver(self as NSObject, forKeyPath: "text", options: .New, context: nil)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if keyPath == "text" {
            
            var sz : CGSize = self.frame.size
            sz.height = 2000
            
            let thatSize = self.sizeThatFits(sz)
            
            sz.height = thatSize.height;
            
            self.labelHeight = sz.height + (Padding * 2) //top + bottom
            
            if weakConstraintForHeight != nil {
                self.weakConstraintForHeight?.constant = self.labelHeight
                
                if self.superview != nil {
                    self.superview?.updateConstraints()
                    self.superview?.setNeedsUpdateConstraints()
                }
                
            }
            else {
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, sz.width, sz.height)
            }
            
            return ;
        }
        
        super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
    }
    
    
    deinit{
        print("MZInfinityVerticalLabel deinit")
        
        self.removeObserver(self as NSObject, forKeyPath: "text")
    }
    
    

}
