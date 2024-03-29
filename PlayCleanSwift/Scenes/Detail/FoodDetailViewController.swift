//
//  FoodDetailViewController.swift
//  PlayCleanSwift
//
//  Created by Ari Supriatna on 05/09/19.
//  Copyright (c) 2019 Ari Supriatna. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FoodDetailDisplayLogic: class
{
  func displaySomething(viewModel: FoodDetail.Something.ViewModel)
}

class FoodDetailViewController: UIViewController, FoodDetailDisplayLogic
{
  var interactor: FoodDetailBusinessLogic?
  var router: (NSObjectProtocol & FoodDetailRoutingLogic & FoodDetailDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = FoodDetailInteractor()
    let presenter = FoodDetailPresenter()
    let router = FoodDetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    
    self.title = foodName
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  @IBOutlet weak var foodNameLabel: UILabel!
  
  var foodName: String?
  
  func doSomething()
  {
    let request = FoodDetail.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: FoodDetail.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
    foodNameLabel.text = foodName
  }
}
