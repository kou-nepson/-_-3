//
//  ViewController.swift
//  日齢君
//
//  Created by 杉山航 on 2016/07/16.
//  Copyright © 2016年 杉山航. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    

    
    @IBOutlet var nen: UITextField!
    @IBOutlet var tsuki: UITextField!
    @IBOutlet var nichi: UITextField!
    @IBOutlet var keca: UILabel!
    @IBOutlet var atonan: UITextField!
    @IBOutlet var keca2: UILabel!
    @IBOutlet var atotoshi: UITextField!
    @IBOutlet var keca3: UILabel!
    @IBOutlet var shousai: UILabel!
    @IBOutlet var shousai2: UILabel!
    @IBOutlet var keca4: UILabel!
    @IBOutlet var keca5: UILabel!
    @IBOutlet var keca6: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nen.keyboardType = UIKeyboardType.numberPad
        tsuki.keyboardType = UIKeyboardType.numberPad
        nichi.keyboardType = UIKeyboardType.numberPad
        atonan.keyboardType = UIKeyboardType.numberPad
        atotoshi.keyboardType = UIKeyboardType.numberPad
    }
    
    //
    
    @IBAction func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func resultButton(_ sender: UIButton){
        // 入力された値からNSDate型の値を作る
        var comp = DateComponents()
        comp.year = Int(nen.text!)!//年を読み込む
        comp.month = Int(tsuki.text!)!//月を読み込む
        comp.day = Int(nichi.text!)!//日にちを読み込む
        let cal: Calendar = Calendar.current//カレンダーを使う
        let birthDate: Date = cal.date(from: comp)!
        
        // 現在の時間のNSDate型を作る
        // timeIntervalSinceDateを使って、日付の差を求める
        let currentDate = Date() // Dec 27, 2015, 7:36 PM
        
        let span = currentDate.timeIntervalSince(birthDate)//差を出す
        let daySpan = Int(span / 60 / 60 / 24) // 14 (日)
        keca.text = String(daySpan)
        
        //
        if atonan.text != "" {
            let atonanInt = Int(atonan.text!)!
            keca2.text = String(atonanInt-daySpan)
        }
        if atotoshi.text != "" {
            let atotoshiInt = Int(atotoshi.text!)!
            var atotoshiComp = DateComponents()
            atotoshiComp.year = Int(nen.text!)! + atotoshiInt
            atotoshiComp.month = Int(tsuki.text!)!
            atotoshiComp.day = Int(nichi.text!)!
            let atotoshiCal: Calendar = Calendar.current
            let atotoshiDate: Date = atotoshiCal.date(from: atotoshiComp)!
            
            let atotoshiSpan = atotoshiDate.timeIntervalSince(currentDate)
            let atotoshiDaySpan = Int(atotoshiSpan / 60 / 60 / 24) // 14 (日)
            keca3.text = String(atotoshiDaySpan)
            
        }
        
        
    }
    
    
    @IBAction func resultButton2(_ sender: UIButton){
        // 入力された値からNSDate型の値を作る
        var comp = DateComponents()
        comp.year = Int(nen.text!)!
        comp.month = Int(tsuki.text!)!
        comp.day = Int(nichi.text!)!
        let cal: Calendar = Calendar.current
        let birthDate: Date = cal.date(from: comp)!
        
        // 現在の時間のNSDate型を作る
        // timeIntervalSinceDateを使って、日付の差を求める
        let currentDate = Date() // Dec 27, 2015, 7:36 PM
        
        let span = currentDate.timeIntervalSince(birthDate)
        let daySpan = Int(span / 60 / 60 / 24) // 14 (日)
        keca.text = String(daySpan)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //任意のメッセージとOKのアラートを持つメソッド
    func simpleAlert(_ titleString: String) {
        
        let alertController = UIAlertController(title: titleString, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    //結果ボタンを押した時に呼び出されるメソッド
    @IBAction func processButtonTapped() {
        
        
        
        
        if (nen.text!.isEmpty || tsuki.text!.isEmpty || nichi.text!.isEmpty) {
            simpleAlert("生年月日が入力されていません")
        } else {
            
            //            @IBAction func resultButton2(sender: UIButton){
            //                // 入力された値からNSDate型の値を作る
            var kakocomp = DateComponents()
            kakocomp.year = Int(nen.text!)!
            kakocomp.month = Int(tsuki.text!)!
            kakocomp.day = Int(nichi.text!)!
            let cal: Calendar = Calendar.current
            let birthDate: Date = cal.date(from: kakocomp)!
            
           
            // 現在の時間のNSDate型を作る
            // timeIntervalSinceDateを使って、日付の差を求める
            let currentDate = Date()
            
            let nowcomp = (cal as NSCalendar).components(
                [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day,
                    NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second],
                from: currentDate)
            //今のデータ
            print(nowcomp.year)
            print(nowcomp.month)
            print(nowcomp.day)
            
            
            let span = currentDate.timeIntervalSince(birthDate)
            let daySpan = Int(span / 60 / 60 / 24)
            keca.text = String(daySpan)
            //
            //
            //            }
            if atonan.text != "" {
                let atonanInt = Int(atonan.text!)!
                keca2.text = String(atonanInt-daySpan)
            }
            if atotoshi.text != "" {
                let atotoshiInt = Int(atotoshi.text!)!
                var atotoshiComp = DateComponents()
                atotoshiComp.year = Int(nen.text!)! + atotoshiInt
                atotoshiComp.month = Int(tsuki.text!)!
                atotoshiComp.day = Int(nichi.text!)!
                let atotoshiCal: Calendar = Calendar.current
                let atotoshiDate: Date = atotoshiCal.date(from: atotoshiComp)!
                
                let atotoshiSpan = atotoshiDate.timeIntervalSince(currentDate)
                let atotoshiDaySpan = Int(atotoshiSpan / 60 / 60 / 24)
                keca3.text = String(atotoshiDaySpan)
                
            }
            
            if atonan.text != "" {
                let atonanInt = Int(atonan.text!)
                keca2.text = String(atonanInt! - daySpan)
            }
            
            print(tsuki.text!)
            print(nowcomp.month)
            
//         （入力された年×１２＋入力された月）ー（今の年×１２＋今の月）
            let getsurei = abs(Int(nen.text!)! * 12 + Int(tsuki.text!)! - nowcomp.year! * 12 + nowcomp.month!)
            keca4.text = String(getsurei)
            
        }
        
        
        
    }
    
    //徳川家康の生年月日を入力する
    @IBAction func ieyas () {
        nen.text = "1543"
        tsuki.text = "1"
        nichi.text = "21"
        self.processButtonTapped()
    }
    //日本の建国記念日を入力する
    @IBAction func kennkoku () {
        nen.text =  "-660"
        tsuki.text = "2"
        nichi.text = "11"
        self.processButtonTapped()
    }
    
        
        //    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //odds & ends
        //    }

        
        
        
        
}

















