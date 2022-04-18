//
//  ViewController.swift
//  ZhihuDemo
//
//  Created by jackfrow on 2022/4/18.
//

import UIKit
import SnapKit
import PromiseKit
import Moya
import ProgressHUD

class ViewController: UIViewController {

    var models:[zhihuModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    
    func loadData()  {
        
    
       firstly { () -> Promise<zhihuResponse> in
           ProgressHUD.show()
           return zhRequestManager.shared.startRequestFetch(MultiTarget.init(ZhihuAPI.latest))
       }.then { response -> Promise<zhihuResponse> in
           return zhRequestManager.shared.startRequestFetch(MultiTarget.init(ZhihuAPI.latest))
       }.done { response in
           
           self.models = response.stories
           self.tableView.reloadData()
           print("response \(response.toJSON())")

       }.ensure {
           ProgressHUD.dismiss()
       }.catch { error in
           print("error \(error)")
       }
        
    }
    
    
    func setupUI()  {
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    
    // MARK: - lazy
    lazy var tableView: UITableView = {
        
        let v = UITableView(frame: .zero, style: .plain)
        v.register(DemoCell.self, forCellReuseIdentifier: "cell")
        v.delegate = self
        v.dataSource = self
        v.tableFooterView = UIView()
        return v
        
    }()


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = self.models?.count else {
            return 0
        }
        return count
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  300
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as?  DemoCell else {
            return UITableViewCell()
        }
        
        if let model = self.models?[indexPath.row]  {
            cell.model = model
        }
        
        return cell
    }
    
    
    
}

