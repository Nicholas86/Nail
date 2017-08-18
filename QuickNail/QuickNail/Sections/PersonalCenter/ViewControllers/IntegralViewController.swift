//
//  IntegralViewController.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/17.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import UIKit

class IntegralViewController: BaseViewController {

    
    @IBOutlet weak var backView: UIView!
    
    //左积分
    @IBOutlet weak var leftPoint: UILabel!
    
    //右积分
    @IBOutlet weak var rightPoint: UILabel!
    
    //积分规则
    @IBOutlet weak var rulesImageView: UIImageView!
    
    //tableview
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
    
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.backView.backgroundColor = groupColor//RGBColor(118, g: 178, b: 254)
        
        self.rulesImageView.layer.cornerRadius = 80 / 2
        
        self.rulesImageView.layer.masksToBounds = true
        
        self.tableView.register(UINib.init(nibName: "IntegralTableViewCell", bundle: nil), forCellReuseIdentifier: "integralTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 71
        self.tableView.hideTableFooterView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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

extension IntegralViewController : UITableViewDataSource,UITableViewDelegate{

    //integralTableViewCell
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "integralTableViewCell", for: indexPath) as! IntegralTableViewCell
        
        
        return cell
    }
    

}





