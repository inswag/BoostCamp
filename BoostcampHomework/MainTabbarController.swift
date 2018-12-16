//
//  MainTabbarController.swift
//  BoostcampHomework
//
//  Created by 박인수 on 15/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation
import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("execute")
        
        let tableViewController = TableViewController()
        let tableNavigationController = UINavigationController(rootViewController: tableViewController)
        tableNavigationController.navigationBar.backgroundColor = .blue
        
        let tableUnselected = UIImage(named: "tableUnselected")
        let tableSelected = UIImage(named: "tableSelected")

        tableNavigationController.tabBarItem.image = tableUnselected
        tableNavigationController.tabBarItem.selectedImage = tableSelected
//        tableNavigationController.tabBarItem.badgeValue = "Table"
//        tableNavigationController.tabBarItem.badgeColor = .white

        
        let layout = UICollectionViewFlowLayout()
        let collectionViewController = CollectionViewController(collectionViewLayout: layout)
        let collectionNavigationController = UINavigationController(rootViewController: collectionViewController)
        collectionNavigationController.navigationBar.backgroundColor = .blue
        
        
        let collectionUnselected = UIImage(named: "collectionUnselected")
        let collectionSelected = UIImage(named: "collectionSelected")

        collectionNavigationController.tabBarItem.image = collectionUnselected
        collectionNavigationController.tabBarItem.selectedImage = collectionSelected

        tabBar.backgroundColor = .blue
        tabBar.tintColor = .white
        
        viewControllers = [tableNavigationController, collectionNavigationController]

        
        
    }

    
    
}
