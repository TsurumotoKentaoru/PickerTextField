//
//  BasePickerViewModel.swift
//  CustomPicker
//
//  Created by 鶴本賢太朗 on 2018/04/27.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import UIKit

// PickerTextFieldクラスのデータソース、デリゲートを司るクラス
class BasePickerViewModel: NSObject, PickerViewModelProtocol {
    
    private(set) var dataSource: [[String]]
    private(set) var selectedRows: [Int]
    
    convenience override init() {
        self.init(dataSource: [], selectedRows: nil)
    }
    
    init(dataSource: [[String]], selectedRows: [Int]?) {
        self.dataSource = dataSource
        if let selectedRows: [Int] = selectedRows, self.dataSource.count == selectedRows.count {
            self.selectedRows = selectedRows
        }
        else {
            self.selectedRows = [Int](repeating: 0, count: self.dataSource.count)
        }
        super.init()
    }
    
    // MARK: 選択されている行を設定する
    internal func setSelectedRows(pickerView: UIPickerView) {
        let compornents: Int = pickerView.numberOfComponents
        self.selectedRows = []
        for compornent in 0 ..< compornents {
            let selectedRow: Int = pickerView.selectedRow(inComponent: compornent)
            self.selectedRows.append(selectedRow)
        }
    }
    
    // MARK: 選択されているテキストを取得する
    internal func selectedTextArr() -> [String] {
        var textList: [String] = []
        for selectedRow in self.selectedRows.enumerated() {
            let component: Int = selectedRow.offset
            let selectedText: String = self.dataSource[component][selectedRow.element]
            textList.append(selectedText)
        }
        return textList
    }
    
    // MARK: UIPickerView DataSource Method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataSource[component].count
    }
}
