//
//  Notification.swift
//  barSwitchTest
//
//  Created by Peggy Tsai on 2021/3/25.
//

import Foundation

//Notification
protocol NotificationRepresentable { }

// 寫在 Protocol extension 裡的方法會預設套用給所有遵守此 protocol 的型別。
extension NotificationRepresentable {
    
    // 跟通知相關的鍵與名稱
    static var notificationName: Notification.Name {
        return .init("")
    }
    
    static var userInfoKey: String {
        return ""
    }
    
    // 將通知的隨附資訊解開成特殊型別的便利建構式
    init?(notification: Notification) {
        
        // 使用 Self 以取得實際上的型別（套用此協定的型別）
        guard let value = notification.userInfo?[Self.userInfoKey] as? Self else { return nil }
        #if DEBUG
        print("value",value)
        #endif
        self = value
    }
    
}
