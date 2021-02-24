//
//  ViewController.swift
//  barSwitchTest
//
//  Created by Peggy Tsai on 2021/2/24.
//

import UIKit

enum PageType {
    case two,three
}

class ViewController: UITabBarController {
    
    var pageType: PageType = .three
    var pageList = [UIViewController]()
    var imageList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let firstVC = storyboard.instantiateViewController(withIdentifier: "firstVcSb") as? FirstVC else{
            assertionFailure("[AssertionFailure] StoryBoard: firstVcSb can't find!! (ViewController)")
            return
        }
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "secondVcSb") as? SecondVC else{
            assertionFailure("[AssertionFailure] StoryBoard: secondVcSb can't find!! (ViewController)")
            return
        }
        guard let thirdVC = storyboard.instantiateViewController(withIdentifier: "thirdVcSb") as? ThirdVC else{
            assertionFailure("[AssertionFailure] StoryBoard: thirdVcSb can't find!! (ViewController)")
            return
        }
        
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
        let count = imageList.count - 1
        guard let items = self.tabBar.items else { return }
        
        for x in 0...count {
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
