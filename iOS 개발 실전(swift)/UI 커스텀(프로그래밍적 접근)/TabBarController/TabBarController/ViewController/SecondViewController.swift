//
//  SecondViewController.swift
//  TabBarController
//
//  Created by gunhyeong on 2020/11/30.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tabBarItem.image = UIImage(named: "file-tree.png")
        self.tabBarItem.title = "file"
        
        setup()
    }
    
    fileprivate func setup() {
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        title.text = "두 번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center // 레이블 내에서 중앙 정렬
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        title.sizeToFit() // 콘텐츠의 내용에 맞게 레이블 크기 변경
        
        title.center.x = self.view.frame.width / 2 // x 축의 중앙에 오도록
        self.view.addSubview(title)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
