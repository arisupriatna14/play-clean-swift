//
//  LoginRouter.swift
//  PlayCleanSwift
//
//  Created by Ari Supriatna on 04/09/19.
//  Copyright (c) 2019 Ari Supriatna. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  func routeToHome(username: String)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
  
  // MARK: Routing
  func routeToHome(username: String) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: "ROOT") as! UITabBarController
    
//    destinationVC.username = username
    
    
    navigateToHome(source: viewController!, destination: destinationVC)
  }
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  func navigateToHome(source: LoginViewController, destination: UITabBarController) {
//    source.show(destination, sender: nil)
    
    source.present(destination, animated: true, completion: nil)
//    source.navigationController?.pushViewController(destination, animated: true)
  }
  
  //func navigateToSomewhere(source: LoginViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
