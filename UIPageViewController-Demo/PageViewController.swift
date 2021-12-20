//
//  PageViewController.swift
//  UIPageViewController-Demo
//
//  Created by Alan Liu on 2021/12/18.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up page view controller
        setupPageVC()
    }
    
    // Set up page view controller
    private func setupPageVC() {
        guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "FirstVC") as? FirstViewController,
              let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController,
              let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdViewController
        else { return }
        
        controllers = [firstVC, secondVC, thirdVC]
        
        guard controllers.indices.contains(1) else { return }
        
        setViewControllers([controllers[1]], direction: .forward, animated: false)
        
        dataSource = self
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    // Swipe to left
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController), index > 0, controllers.indices.contains(index - 1) {
            return controllers[index - 1]
        } else {
            return nil
        }
    }
    
    // Swipe to right
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController), index < controllers.count - 1, controllers.indices.contains(index + 1) {
            return controllers[index + 1]
        } else {
            return nil
        }
    }
}
