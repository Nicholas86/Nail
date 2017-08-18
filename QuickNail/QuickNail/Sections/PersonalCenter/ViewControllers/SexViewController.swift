//
//  SexViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/10.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

//枚举
enum SexVCType : Int{
    case sex = 0 //性别
    case star = 1 //星座
    case hobbit = 2 //兴趣爱好
    case industry = 3 //行业
}

class SexViewController: BaseViewController {

    var disposeBag = DisposeBag()

    var sexVCType : SexVCType = SexVCType.sex
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 100), style: .plain)
        tableView.register(UINib.init(nibName: "SexViewTableViewCell", bundle: nil), forCellReuseIdentifier: "sexViewTableViewCell")
        tableView.indicatorStyle = .black
        tableView.hideTableFooterView()
        return tableView
    }()

    lazy var sexViewModel: SexViewModel = {
        let sexViewModel = SexViewModel()
        return sexViewModel
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if sexVCType == .sex {
            title = "性别"
        }else if (sexVCType == .star){
            title = "星座"
        }else if (sexVCType == .hobbit){
            title = "爱好"
        }else if (sexVCType == .industry){
            title = "行业"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.dataSource = (sexViewModel as UITableViewDataSource)
        tableView.delegate = (sexViewModel as UITableViewDelegate)
        
        //接收传值
        sexViewModel.rx_sex.asObservable().subscribe(onNext: {[weak self] (sexString) in
            printLog(message: " 接收性别 -- \(sexString)")
            if (sexString.isEmpty){
                return
            }
            self?.navigationController?.popViewController(animated: true)
        }).addDisposableTo(disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



