//
//  RegisterViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/8.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

enum RegisterType  : Int{
    case registerType = 0 //注册
    case forgtetType = 1  //忘记密码
}

class RegisterViewController: BaseViewController {

    var disposeBag = DisposeBag()

    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var finishBtn: UIButton!
    
    
    var registerType : RegisterType = RegisterType.init(rawValue: 0)!
    
    lazy var registerViewModel: RegisterViewModel = {

        let registerViewModel = RegisterViewModel.init(input: (
            userName: self.phoneTextField.rx.text.orEmpty.asDriver(),
            passWord: self.passwordTextField.rx.text.orEmpty.asDriver(),
            repeatPassWord: self.repeatPasswordTextField.rx.text.orEmpty.asDriver(),
            registerType:self.registerType,
            loginTaps: self.finishBtn.rx.tap.asDriver()),
                                                       
            dependency: (
                //验证 参数
                validationServiceDelegate: ImplementationRegisterValidationServiceDelegate.sharedValidationService,
                //注册 网络请求 ---- 初始化一次
                api: ImplementationRegisterDelegate.sharedAPI,
                wireFrame: DefaultWireframe.sharedInstance)
        )
        
        return registerViewModel
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if registerType == .forgtetType {
            title = "忘记密码"
            passwordTextField.placeholder = "请输入6位以上新密码"
        }else{
            title = "注册"
            passwordTextField.placeholder = "请输入6位以上密码"
        }
        
        phoneTextField.leftImageView()
        codeTextField.leftImageView()
        passwordTextField.leftImageView()
        repeatPasswordTextField.leftImageView()
        
        //参数绑定
        bindData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func codeBtn(_ sender: Any) {
        
        
    }
    
}

//MARK:参数绑定
extension RegisterViewController {
    
    func bindData() -> Void {
        
        //1.用户名  发出的信号由密码输入框绑定,控制密码输入框是否允许输入
        registerViewModel.validatePhoneNumber
            .drive(codeTextField.rx.inputEnable) //验证码绑定
            .addDisposableTo(disposeBag)
        
        registerViewModel.validatePhoneNumber//密码绑定
            .drive(passwordTextField.rx.inputEnable) //isEnabled  isHidden
            .addDisposableTo(disposeBag)

        //2.密码 重复密码绑定
        registerViewModel.validatePassWord
            .drive(repeatPasswordTextField.rx.inputEnable)
            //.drive(repeatPassWordActivityLabel.rx.validationResult)
            .addDisposableTo(disposeBag)
        
        //3.重复密码
        registerViewModel.validatedPasswordRepeated
            .drive()
            .addDisposableTo(disposeBag)
        
        //4.注册 结果  --- 成功 失败
        registerViewModel.registerResult
                         .drive(onNext: { [weak self](registerResult) in
                            
                            print("用户 注册 \(registerResult)")
                            if registerResult{
                                self?.navigationController?.popViewController(animated: true)
                            }
                            
                         })
                         .addDisposableTo(disposeBag)
        
        
        //5.注册按钮用户交互
        // 按钮不是绑定， 按钮是 drive /subcribe, 需要操作的
        //weak var weakSelf = self
        registerViewModel.registerEnabled
                         .drive(onNext: { [weak self] valid in
                            self?.finishBtn.isEnabled = valid
                            self?.finishBtn.alpha = valid ? 1.0 : 0.5
                         })
                        .addDisposableTo(disposeBag)
        
    }
    
}






