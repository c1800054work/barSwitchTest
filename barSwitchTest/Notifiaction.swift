//
//  Notification.swift
//  barSwitchTest
//
//  Created by Peggy Tsai on 2021/3/25.
//

import Foundation

//Notification
protocol NotificationRepresentable { }

extension NotificationRepresentable {
    
    static var notificationName: Notification.Name {
        return .init("")
    }
    
    static var userInfoKey: String {
        return ""
    }
    
    init?(notification: Notification) {
        
        guard let value = notification.userInfo?[Self.userInfoKey] as? Self else { return nil }
        #if DEBUG
        print("value",value)
        #endif
        self = value
    }
}
