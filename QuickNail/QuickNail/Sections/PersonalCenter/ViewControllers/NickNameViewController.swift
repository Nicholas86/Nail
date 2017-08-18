//
//  NickNameViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/10.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

//枚举
enum NickNameVCType : Int{
    case nickName = 0  //昵称
    case realName = 1  //真实姓名
    case phoneNumber = 2 //手机号
    case email = 3 //邮箱
}

/*
struct NickNameStruct {
    var nickName : String
    var age : Int
    var gender : String
}
*/

class NickNameViewController: BaseViewController {

    @IBOutlet weak var nickNameTextFiled: UITextField!
    
    //声明枚举变量 并 初始化 2种
    //var nickNameVCType : NickNameVCType = NickNameVCType.nickName
    var nickNameVCType : NickNameVCType = NickNameVCType.init(rawValue: 0)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if nickNameVCType == .nickName {
            title = "昵称"
            nickNameTextFiled.placeholder = "请输入昵称"
        }else if (nickNameVCType == .realName){
            title = "真实姓名"
            nickNameTextFiled.placeholder = "请输入真实姓名"
        }else if (nickNameVCType == .phoneNumber){
            title = "手机号"
            nickNameTextFiled.placeholder = "请输入手机号"
            nickNameTextFiled.keyboardType = .numberPad
        }else if (nickNameVCType == .email){
            title = "邮箱"
            nickNameTextFiled.placeholder = "请输入邮箱"
            nickNameTextFiled.keyboardType = .emailAddress
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func configurationBaseViews() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(saveTarget: self, action: #selector(saveItem))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NickNameViewController{
    
    func saveItem() -> Void {
        
    }
    
}




