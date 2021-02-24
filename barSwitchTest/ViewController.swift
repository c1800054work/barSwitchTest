//
//  ViewController.swift
//  barSwitchTest
//
//  Created by Peggy Tsai on 2021/2/24.
//

import UIKit

class ViewController: UITabBarController {
    
    @IBOutlet weak var switchBarItem: UINavigationItem!
    
    var pageType: PageType = .three
    var pageList = [UIViewController]()
    var imageList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar(){
        let firstVC = FirstVC()
        let secondVC = SecondVC()
        let thirdVC = ThirdVC()
        
        firstVC.title = "firstVC"
        secondVC.title = "secondVC"
        thirdVC.title = "thirdVC"
        
        switch pageType {
        case .three:
            pageList = [firstVC,secondVC,thirdVC]
            imageList = ["folder","trash","pencil"]
        case .two:
            pageList = [firstVC,secondVC]
            imageList = ["folder","trash"]
        }
        self.setViewControllers(pageList, animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        for x in 0...imageList.count-1 {
            items[x].image = UIImage(systemName: imageList[x])
        }
        
        self.tabBar.tintColor = .green
    }
    
    @IBAction func switchBarPress(_ sender: UIBarButtonItem) {
        switch pageType {
        case .three:
            pageType = .two
        case .two:
            pageType = .three
        }
        setTabBar()
    }
}

class FirstVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class SecondVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}

class ThirdVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

enum PageType {
    case two,three
}
