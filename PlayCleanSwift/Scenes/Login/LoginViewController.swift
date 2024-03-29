//
//  LoginViewController.swift
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

protocol LoginDisplayLogic: class
{
  func displayLogin(viewModel: Login.FetchLogin.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

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
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
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
    messageLabel.text = ""
  }
  
  // MARK: Login
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var messageLabel: UILabel!
  
  //MARK: IBAction
  
  @IBAction func loginButtonTapped(_ sender: Any) {
    doLogin()
  }
  
  func doLogin()
  {
    let username = usernameTextField.text!
    let password = passwordTextField.text!
    
    let request = Login.FetchLogin.Request(username: username, password: password)
    interactor?.login(request: request)
  }
  
  func displayLogin(viewModel: Login.FetchLogin.ViewModel)
  {
    if viewModel.dataViewModel.successLogin {
      messageLabel.textColor = UIColor.green
      messageLabel.font = messageLabel.font.withSize(18)
      messageLabel.text = "Login Success"
      
      router?.routeToHome(username: viewModel.dataViewModel.username)
    } else {
      messageLabel.textColor = UIColor.red
      messageLabel.text = "Username or password wrong!"
    }
  }
}
