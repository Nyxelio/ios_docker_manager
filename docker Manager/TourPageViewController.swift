//
//  TourPageViewController.swift
//  docker Manager
//
//  Created by Developer on 22/03/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import UIKit

class TourPageViewController: UIPageViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
    
    var index = 0
    var identifiers: NSArray = ["Tour1View", "Tour2View", "Tour3View", "Tour4View", "Tour5View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        let startingViewController = self.viewControllerAtIndex(index: self.index)
        
        let viewControllers: NSArray = [startingViewController]
        
        self.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        UIPageControl.appearance().tintColor = UIColor.black
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewControllerAtIndex(index: Int) -> UIViewController! {
        
       return self.storyboard!.instantiateViewController(withIdentifier: "Tour"+String(index+1)+"View")
        
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.index(of: identifier!)
        
        if index == identifiers.count - 1 {
            
            return nil
        }
        
        self.index = self.index + 1
        return self.viewControllerAtIndex(index: self.index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let identifier = viewController.restorationIdentifier
        let index = self.identifiers.index(of: identifier!)
        
        if index != 0 {
            self.index = self.index - 1

        }
        
        return self.viewControllerAtIndex(index: self.index)
        
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor =  UIColor(red: 0x9B/255, green: 0x59/255, blue: 0xB6/255, alpha: 1)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.identifiers.count

    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
