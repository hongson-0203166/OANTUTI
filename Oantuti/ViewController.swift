//
//  ViewController.swift
//  Oantuti
//
//  Created by Phạm Hồng Sơn on 01/11/2023.
//

import UIKit


class ViewController: UIViewController {
    var arrOption = ["keo","bua","bao"]
    let resultLable: UILabel = {
       let lable = UILabel()
        //lable.text = "Win".uppercased()
        lable.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        lable.textAlignment = .center
        lable.textColor = .black
        return lable
    }()

    let playonLable: UILabel = {
       let lable = UILabel()
        lable.text = "Let's Play!"
        lable.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        lable.textAlignment = .center
        lable.textColor = .black
        return lable
    }()

    let playView: UIView = {
       let view = UIView()
        return view
    }()

    let optionButtonKeo : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "keo"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()

    let optionButtonBua : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bua"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()
    let optionButtonBao : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bao"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()

    let resultOptionPerson:UIImageView = {
        let view = UIImageView()
         return view
    }()
    
    let resultOptionBot:UIImageView = {
        let view = UIImageView()
         return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setResultLable()
        view.addSubview(playView)
        playView.frame = CGRect(x: 0, y: 150, width: Int(view.frame.width), height: 500)
//        playView.backgroundColor = .red
        setButton()
        setInsideView()
        
    }
    
    func setResultLable(){
        view.addSubview(resultLable)
        resultLable.frame = CGRect(x: 0, y: 50, width: 200, height: 100)
        resultLable.center.x = view.center.x
    }
    
    func setInsideView(){
        playView.addSubview(playonLable)
        playonLable.frame = CGRect(x: 0, y: 140, width: 200, height: 100)
        playonLable.center.x = playView.center.x
        
        playView.addSubview(resultOptionPerson)
        resultOptionPerson.frame = CGRect(x: 40, y: 200, width: 100, height: 100)
        
        playView.addSubview(resultOptionBot)
        resultOptionBot.frame = CGRect(x: view.frame.width - 140, y: 200, width: 100, height: 100)
        
        
        
    }
    func luachonmay(){
        var ramdom:String = arrOption.randomElement() ?? ""
        if resultOptionBot.image == UIImage(named: ramdom){
            luachonmay()
            return
        }
        resultOptionBot.image = UIImage(named: ramdom)
    }
    
    func setButton(){
        view.addSubview(optionButtonBua)
        view.addSubview(optionButtonKeo)
        view.addSubview(optionButtonBao)
        optionButtonBua.frame = CGRect(x: 50, y: 730, width: 50, height: 50)
        optionButtonBua.layer.cornerRadius = 25
        optionButtonBua.layer.masksToBounds = true
        optionButtonBua.addTarget(self, action: #selector(clickBua), for: .touchUpInside)
        
        optionButtonBao.frame = CGRect(x: 170, y: 730, width: 50, height: 50)
        optionButtonBao.layer.cornerRadius = 25
        optionButtonBao.layer.masksToBounds = true
        optionButtonBao.addTarget(self, action: #selector(clickBao), for: .touchUpInside)

        
        optionButtonKeo.frame = CGRect(x: 290, y: 730, width: 50, height: 50)
        optionButtonKeo.layer.cornerRadius = 25
        optionButtonKeo.layer.masksToBounds = true
        optionButtonKeo.addTarget(self, action: #selector(clickKeo), for: .touchUpInside)

    }
    @objc func clickBua(){
        resultOptionPerson.image = UIImage(named: "bua")
        luachonmay()
        playonLable.isHidden = true
    if (resultOptionPerson.image == UIImage(named: "bua")) && (resultOptionBot.image == UIImage(named: "keo")){
        resultLable.text = "WIN"
    } else if (resultOptionPerson.image == UIImage(named: "bua")) && (resultOptionBot.image == UIImage(named: "bua")){
        resultLable.text = "DRAW"
    }else if (resultOptionPerson.image == UIImage(named: "bua")) && (resultOptionBot.image == UIImage(named: "bao")){
        resultLable.text = "LOSE"
    }
        
    }
    @objc func clickBao(){
            resultOptionPerson.image = UIImage(named: "bao")
        luachonmay()
        playonLable.isHidden = true
        if  resultOptionBot.image == UIImage(named: "keo"){
            resultLable.text = "LOSE"
        } else if resultOptionBot.image == UIImage(named: "bua"){
            resultLable.text = "WIN"
        }else if resultOptionBot.image == UIImage(named: "bao"){
            resultLable.text = "DRAW"
        }
         
    }
    @objc func clickKeo(){
        resultOptionPerson.image = UIImage(named: "keo")
        luachonmay()
        playonLable.isHidden = true
        if  resultOptionBot.image == UIImage(named: "keo"){
            resultLable.text = "DRAW"
        } else if resultOptionBot.image == UIImage(named: "bua"){
            resultLable.text = "LOSE"
        }else if resultOptionBot.image == UIImage(named: "bao"){
            resultLable.text = "WIN"
            
        }
        
    }
    
    

}

