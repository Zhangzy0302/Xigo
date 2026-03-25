//
//  XigoApp.swift
//  Xigo
//
//  Created by yangyang on 2026/2/12.
//

import SwiftUI
import AdjustSdk

@main
struct XigoApp: App {
    @StateObject private var xigoNavi: UxzuaNaaviManer = UxzuaNaaviManer()
    
    @StateObject private var xawuxLAiwMUSerViewModel: XawuxLAiwMUSerViewModel = XawuxLAiwMUSerViewModel()
    @StateObject private var erwyAuwVideoViewModel: ErwyAuwVideoViewModel = ErwyAuwVideoViewModel()
    @StateObject private var sswzuLwoqxChatViewModel: SswzuLwoqxChatViewModel = SswzuLwoqxChatViewModel()
    @StateObject private var manuwqoAiCommentsViewModel: ManuwqoAiCommentsViewModel = ManuwqoAiCommentsViewModel()
    @StateObject private var wuiqbahaCosPostsViewModel: WUiqbahCosPostsViewModel = WUiqbahCosPostsViewModel()
    @StateObject private var iwhanxaIAPManager: IwhanxaIAPManager = IwhanxaIAPManager()

    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    init() {
        Task {
            await HxwuqHgeywcGetPhoneInfo.shared.hxwuqHgeywcGetPhoneInfo()
            UwhxAUBSKAdjustManager.shared.slwinxAiuwnInitialize()
        }
    }
    
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

final class UwhxAUBSKAdjustManager: UIResponder, UIApplicationDelegate, AdjustDelegate {

  static let shared = UwhxAUBSKAdjustManager()

  private let slwinxAiuwnInstallToken = "px7sp2"
  private let slwinxAiuwnPurchaseToken = "cj00fv"
  private let slwinxAiuwnAppToken = "mqbve4fst81s"

  private override init() {}

  // MARK: - 初始化
  func slwinxAiuwnInitialize() {
    guard
      let slwinxAiuwnConfitg = ADJConfig(
        appToken: slwinxAiuwnAppToken,
        environment: ADJEnvironmentProduction
      )
    else { return }

    slwinxAiuwnConfitg.logLevel = ADJLogLevel.verbose
    slwinxAiuwnConfitg.enableSendingInBackground()
    slwinxAiuwnConfitg.delegate = self
//      print("Adjust:ta_distinct_id: \(RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid)")
      Adjust.addGlobalCallbackParameter(RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid, forKey: "ta_distinct_id")
    Adjust.attribution { attribution in
      self.adjustAttributionChanged(attribution)
    }
    Adjust.initSdk(slwinxAiuwnConfitg)
  }

  // MARK: - 安装事件
  func adjustAttributionChanged(_ attribution: ADJAttribution?) {
    let event = ADJEvent(eventToken: slwinxAiuwnInstallToken)
    Adjust.trackEvent(event)
  }

  // MARK: - 购买事件
  func slwinxAiuwnTrackPurchase(dollar: Double) {
    let event = ADJEvent(eventToken: slwinxAiuwnPurchaseToken)
    event?.setRevenue(dollar, currency: "USD")
    Adjust.trackEvent(event)
  }

}
