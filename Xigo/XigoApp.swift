//
//  XigoApp.swift
//  Xigo
//
//  Created by yangyang on 2026/2/12.
//

import SwiftUI

@main
struct XigoApp: App {
    @StateObject private var xigoNavi: UxzuaNaaviManer = UxzuaNaaviManer()
    
    var body: some Scene {
        WindowGroup {
            UxzuaXigoRouterStack()
                .environmentObject(xigoNavi)
        }
    }
}
