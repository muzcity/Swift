//
//  ViewController.swift
//  SwiftSample
//
//  Created by muzcity on 2015. 7. 11..
//  Copyright (c) 2015년 muzcity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	//let로 했을때 생성을 같이 해버린다.
	private let tvSample = UITableView.new();
	
	//타이틀 이름.
	private let tableViewTitles : Array<String> = ["UILabel Sample", "UIButton Sample"]
	
	override func loadView() {
		super.loadView()
		
		self.view.backgroundColor = UIColor.blueColor()
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.title = "Swift Sample"
		
		self.tvSample.delegate = self
		self.tvSample.dataSource = self
		
		
		self.view.addSubview(self.tvSample);
		
		
		//autolayout vfl.
		var tv : UITableView = self.tvSample;
		tv.setTranslatesAutoresizingMaskIntoConstraints(false)
		self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tv]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["tv":tv]))
		
		self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tv]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["tv":tv]))
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	// MARK: - 데이터 소스, 델리게이트만 연결하고 구현을 하지 않으면 에러를 뱉어낸다.
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return self.tableViewTitles.count;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		let cellID : String = "cellId"
		
		//nil일수 있으므로 ? 로 표시를 해야한다. !로 하면 에러.
		// !로 하면 nil일수 없는데 nil이 들어와서 에러.
		// 아무표시를 안하면 기본 동작이 !로 되는듯... 에러
		// 타입 캐스팅이 제대로 되지 않으면 모두다 에러.  변수 선언에서 없는것, !, ?에 따라 아래 조건절 리턴값등이 모두 영향을 받는다.
		
		//cell이 널이 올수도 있다. 고로 ?가 되어야함.  변수 선언 as 구분모두.
		var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell
		if cell == nil {
			cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID);
			
			println("\(indexPath.row)");
		}
		

		//위에서 ?로 되어 있기때문에 cell이 널일수있기때문에 ? 표시 textLabel은 기본으로 생성 항상 있으므로 !로 처리.
		cell?.textLabel!.text = self.tableViewTitles[indexPath.row];
		
		//리턴값은 아무것도 없는 형태, 꼭 셀을 리턴해야하므로 !표시.
		return cell!;
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		switch indexPath.row {
		case 0:
			var vc = UILabelSampleViewController()
			
			self.navigationController?.pushViewController(vc, animated: true)

		case 1:
			var vc = UIButtonSampleViewController(nibName: "UIButtonSampleViewController", bundle: nil)
			
			self.navigationController?.pushViewController(vc, animated: true)
			
		default:
			break
		}
		
		
	}


}

