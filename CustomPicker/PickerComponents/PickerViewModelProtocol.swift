//
//  PickerViewModel.swift
//  eggs
//
//  Created by 鶴本賢太朗 on 2017/11/26.
//  Copyright © 2017年 solidsphere. All rights reserved.
//

import UIKit

protocol PickerViewModelProtocol: UIPickerViewDataSource, UIPickerViewDelegate {
    var dataSource: [[String]] { get }
    var selectedRows: [Int] { get }
}
