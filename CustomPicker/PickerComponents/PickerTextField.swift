//
//  PickerTextField.swift
//  CustomPicker
//
//  Created by 鶴本賢太朗 on 2018/04/27.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import UIKit

protocol PickerTextFieldDelegate: class {
    func onTapDone(pickerTextField: PickerTextField)
    func onTapCancel(pickerTextField: PickerTextField)
}

// 入力フォームがピッカーのTextFieldクラス
class PickerTextField: UITextField {
    
    internal let pickerView: UIPickerView
    internal weak var pickerDelegate: PickerTextFieldDelegate?
    
    private (set) var pickerViewModel: BasePickerViewModel?
    
    init(model: BasePickerViewModel) {
        self.pickerView = UIPickerView()
        super.init(frame: CGRect.zero)
        self.initPickerViewUI()
        self.setPickerViewModel(model: model)
    }
    
    override init(frame: CGRect) {
        self.pickerView = UIPickerView()
        super.init(frame: frame)
        self.initPickerViewUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.pickerView = UIPickerView()
        super.init(coder: aDecoder)
        self.initPickerViewUI()
    }
    
    // ピッカーのモデルクラスからデータソースと選択されている行を設定する
    internal func setPickerViewModel(model: BasePickerViewModel) {
        self.pickerViewModel = model
        self.pickerView.dataSource = model
        self.pickerView.delegate = model
        self.setSelectedRows(model: model)
    }
    
    // MARK: ピッカーの選択されている行を設定する
    private func setSelectedRows(model: BasePickerViewModel) {
        // 選択されている行を設定する
        let numComponents: Int = self.pickerView.numberOfComponents
        if numComponents == model.dataSource.count && numComponents == model.selectedRows.count {
            for selectedRow in model.selectedRows.enumerated() {
                let component: Int = selectedRow.offset
                if model.dataSource[component].count > selectedRow.element {
                    self.pickerView.selectRow(selectedRow.element, inComponent: component, animated: true)
                }
            }
        }
    }
    
    // MARK: ピッカーのUIコンポーネントを初期化する
    private func initPickerViewUI() {
        let toolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        // 真ん中のスペース
        let space: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        // キャンセルボタン
        let cancel: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.onTapCancel))
        // 完了ボタン
        let done: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.onTapDone))
        toolBar.setItems([cancel, space, done], animated: true)
        
        self.inputView = self.pickerView
        self.inputAccessoryView = toolBar
    }
    
    // MARK: 完了ボタンタップ
    @objc private func onTapDone() {
        // 完了したのでmodelの選択リストも更新する
        if let pickerViewModel: BasePickerViewModel = self.pickerViewModel {
            pickerViewModel.setSelectedRows(pickerView: self.pickerView)
        }
        self.pickerDelegate?.onTapDone(pickerTextField: self)
    }
    
    // MARK: キャンセルボタンタップ
    @objc private func onTapCancel() {
        // 前の選択状態に戻す
        if let pickerViewModel: BasePickerViewModel = self.pickerViewModel {
            self.setSelectedRows(model: pickerViewModel)
        }
        self.pickerDelegate?.onTapCancel(pickerTextField: self)
    }
}

