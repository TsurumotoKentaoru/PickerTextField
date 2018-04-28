//
//  TestPickerViewModel.swift
//  CustomPicker
//
//  Created by 鶴本賢太朗 on 2018/04/27.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import UIKit

class TestPickerViewModel: BasePickerViewModel {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 1 {
            return self.dataSource[component][row] + " 時"
        }
        else if component == 2 {
            return self.dataSource[component][row] + " 分"
        }
        else {
            return self.dataSource[component][row]
        }
    }
}

class TestPickerViewModel2: BasePickerViewModel {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataSource[component][row]
    }
}
