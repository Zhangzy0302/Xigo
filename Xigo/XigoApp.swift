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
    
    @StateObject private var xawuxLAiwMUSerViewModel: XawuxLAiwMUSerViewModel = XawuxLAiwMUSerViewModel()
    @StateObject private var erwyAuwVideoViewModel: ErwyAuwVideoViewModel = ErwyAuwVideoViewModel()
    @StateObject private var sswzuLwoqxChatViewModel: SswzuLwoqxChatViewModel = SswzuLwoqxChatViewModel()
    @StateObject private var manuwqoAiCommentsViewModel: ManuwqoAiCommentsViewModel = ManuwqoAiCommentsViewModel()
    
    var body: some Scene {
        WindowGroup {
            UxzuaXigoRouterStack()
                .environmentObject(xigoNavi)
                .environmentObject(xawuxLAiwMUSerViewModel)
                .environmentObject(erwyAuwVideoViewModel)
                .environmentObject(sswzuLwoqxChatViewModel)
                .environmentObject(manuwqoAiCommentsViewModel)
                .overlay{
                    DwhaiXeuHUDView()
                }
                .onAppear{
                    XigoAuwStorageManager.shared.initializeAllDefaults()
                }
        }
    }
}
