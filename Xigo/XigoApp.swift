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
    @StateObject private var wuiqbahaCosPostsViewModel: WUiqbahCosPostsViewModel = WUiqbahCosPostsViewModel()
    @StateObject private var iwhanxaIAPManager: IwhanxaIAPManager = IwhanxaIAPManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                UxzuaXigoRouterStack()
                if xigoNavi.uzlajShowBlock {
                    JayuwalReportBlock(jayuwalIsShowBlock: $xigoNavi.uzlajShowBlock)
                        .transition(.opacity)
                }
                
                DwhaiXeuHUDView()
            }.ignoresSafeArea()
            .environmentObject(xigoNavi)
                .environmentObject(xawuxLAiwMUSerViewModel)
                .environmentObject(erwyAuwVideoViewModel)
                .environmentObject(sswzuLwoqxChatViewModel)
                .environmentObject(manuwqoAiCommentsViewModel)
                .environmentObject(wuiqbahaCosPostsViewModel)
                .environmentObject(iwhanxaIAPManager)
                .onAppear{
                    XigoAuwStorageManager.shared.initializeAllDefaults()
                    iwhanxaIAPManager.psieAJxaloietchProducts()
                    xawuxLAiwMUSerViewModel.loadLoginXawuxLAiwMUser()
                }
            
                
        }
    }
}
