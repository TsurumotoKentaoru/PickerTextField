//
//  ViewController.swift
//  CustomPicker
//
//  Created by 鶴本賢太朗 on 2018/04/27.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerTextField: PickerTextField!
    private var pickerTextField2: PickerTextField!
    private var pickerViewModel: TestPickerViewModel!
    private var pickerViewModel2: TestPickerViewModel2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storyboardで生成する場合
        let dateList: [[String]] = [["当日", "1日前", "2日前", "3日前"], ["0", "1", "2", "3", "4","5", "6", "7", "8", "9","10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"], ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]]
        self.pickerViewModel = TestPickerViewModel(dataSource: dateList, selectedRows: [1, 20, 50])
        self.pickerTextField.setPickerViewModel(model: self.pickerViewModel)
        self.pickerTextField.pickerDelegate = self
        
        // コードで生成する場合
        self.pickerViewModel2 = TestPickerViewModel2(dataSource: [["アイウエオ", "かきくけこ"], ["さしすせそ", "たちつてと"]], selectedRows: nil)
        self.pickerTextField2 = PickerTextField(model: self.pickerViewModel2)
        self.pickerTextField2.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        self.pickerTextField2.pickerDelegate = self
        self.pickerTextField2.backgroundColor = .cyan
        self.view.addSubview(self.pickerTextField2)
    }
}

extension ViewController: PickerTextFieldDelegate {
    
    func onTapDone(pickerTextField: PickerTextField) {
        pickerTextField.resignFirstResponder()
    }
    func onTapCancel(pickerTextField: PickerTextField) {
        pickerTextField.resignFirstResponder()
    }
}
