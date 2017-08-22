//
//  LoginViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/7/27.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

class LoginViewController: BaseViewController {
    
    
    var disposeBag = DisposeBag()

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    

    lazy var loginViewModel: LoginViewModel = {
        
        let loginViewModel = LoginViewModel.init(
            
            input: (
                phoneString: self.accountTextField.rx.text.orEmpty.asObservable(),
                passwordString: self.passwordTextField.rx.text.orEmpty.asObservable(),
                loginTaps: self.loginBtn.rx.tap.asObservable()
            ),
            
            dependency: (
                loginServiceDelegate: ImplementLoginServiceDelegate.sharedLoginService,
                         api: ImplementLoginDelegate.sharedImplementLoginDelegate)
            )
        
        return loginViewModel
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bindData()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func configurationBaseViews() {
        
        self.accountTextField.leftImageView()
        self.passwordTextField.leftImageView()
        
    }

    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let registerVC = segue.destination as! RegisterViewController

        let identifier = segue.identifier!
        
        if identifier == "forget" {
            
            registerVC.registerType = .forgtetType
        }else if (identifier == "register"){
            
            registerVC.registerType = .registerType
        }
        
     }
    

}

//MARK:参数绑定
extension LoginViewController {
    
    func bindData() -> Void {
        
        //1.用户名  发出的信号由密码输入框绑定,控制密码输入框是否允许输入
        loginViewModel.phoneValid
                .bindTo(self.passwordTextField.rx.isEnabled)
                .addDisposableTo(disposeBag)
        
        
        //2.登录 结果  --- 成功 失败
        loginViewModel.loginResult
            .subscribe(onNext: { [weak self] result in
                
                if result {
                    
                    printLog(message: "登录成功 \(result)")
                    
                    //self?.showAlter(message: "登录成功！")
                    //主线程刷新
                    DispatchQueue.main.async {
                        
                        let baseTabBarVC = self?.viewControllerFromStoryboar(storboordName: "Main", storboardControllerIdentifier: "baseTabBarViewController") as! BaseTabBarViewController
                        
                        UIApplication.shared.keyWindow?.rootViewController = baseTabBarVC

                    }

                    
                } else {
                    printLog(message: "用户名或密码不正确 \(result)")
                }
                
            })
            .addDisposableTo(disposeBag)

        
        
        //3.按钮用户交互
        // 按钮不是绑定， 按钮是 drive /subcribe, 需要操作的
        //weak var weakSelf = self
        loginViewModel.loginBtnEnable
            .bindTo(loginBtn.rx.isEnabled)
            .addDisposableTo(disposeBag)
        
    }
    
}





