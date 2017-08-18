//
//  SignalViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/10.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit


class SignalViewController: BaseViewController {

    @IBOutlet weak var signalTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "签名"
        
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

extension SignalViewController{
    
    func saveItem() -> Void {
        
    }
    
}



