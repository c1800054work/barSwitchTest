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
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(switchBarPress),
                         name: NSNotification.Name("switchTabBar"),
                         object: nil)
        setTabBar()
    }
    
    func setTabBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let firstVC = storyboard.instantiateViewController(withIdentifier: "firstVcSb") as? FirstVC else{
            assertionFailure("[AssertionFailure] StoryBoard: firstVcSb can't find!! (UITabBarController)")
            return
        }
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "secondVcSb") as? SecondVC else{
            assertionFailure("[AssertionFailure] StoryBoard: secondVcSb can't find!! (UITabBarController)")
            return
        }
        guard let thirdVC = storyboard.instantiateViewController(withIdentifier: "thirdVcSb") as? ThirdVC else{
            assertionFailure("[AssertionFailure] StoryBoard: thirdVcSb can't find!! (UITabBarController)")
            return
        }
        self.tabBar.tintColor = .green
        switch pageType {
        case .three:
            viewControllers = [
                createTabBarItem(tabBarTitle: "firstVC",
                                 tabBarImage: "folder",
                                 viewController: firstVC),
                createTabBarItem(tabBarTitle: "secondVC",
                                 tabBarImage: "trash",
                                 viewController: secondVC),
                createTabBarItem(tabBarTitle: "thirdVC",
                                 tabBarImage: "pencil",
                                 viewController: thirdVC),
            ]
        case .two:
            viewControllers = [
                createTabBarItem(tabBarTitle: "firstVC",
                                 tabBarImage: "folder",
                                 viewController: firstVC),
                createTabBarItem(tabBarTitle: "thirdVC",
                                 tabBarImage: "pencil",
                                 viewController: thirdVC),
            ]
        }
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController{
        let navCont = UINavigationController(rootViewController: viewController)

        navCont.tabBarItem.title = tabBarTitle
        navCont.tabBarItem.image = UIImage(systemName: tabBarImage)

        // Nav Bar Customisation
        navCont.navigationBar.barTintColor = .green
        navCont.navigationBar.tintColor = .red
        navCont.navigationBar.isTranslucent = false

        return navCont
    }
    
    @objc func switchBarPress() {
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
    
    @IBAction func switchBtnPress(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "switchTabBar"), object: nil, userInfo:nil)
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
