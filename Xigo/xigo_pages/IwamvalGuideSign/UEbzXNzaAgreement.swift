import SwiftUI
import WebKit
import ScreenShield

struct AXaixlkalAJxlpWebView: UIViewRepresentable {

    let urlString: String
    let bridge: WebViewBridge   // 外部传进来//2026.3.24(openBrowser事件修改)
    var onLoadingStart: (() -> Void)?
    var onLoadingFinish: ((Int) -> Void)?
    var onClose: (() -> Void)?
    var onRecharge: ((String, String) -> Void)?
    var onopenBrowser: ((String) -> Void)? //urlString
    
    func makeUIView(context: Context) -> WKWebView {

      let config = WKWebViewConfiguration()
      let contentController = WKUserContentController()

      // JS 回调
      contentController.add(context.coordinator, name: "rechargePay")
      contentController.add(context.coordinator, name: "Close")
      contentController.add(context.coordinator, name: "openBrowser")

      config.userContentController = contentController
      config.mediaTypesRequiringUserActionForPlayback = []
      config.allowsInlineMediaPlayback = true

      let webView = WKWebView(frame: .zero, configuration: config)

      webView.uiDelegate = context.coordinator
      webView.navigationDelegate = context.coordinator
      webView.isOpaque = false
      webView.backgroundColor = .clear
      webView.scrollView.backgroundColor = .clear
      webView.scrollView.contentInsetAdjustmentBehavior = .never
      webView.scrollView.contentInset = .zero
      webView.scrollView.scrollIndicatorInsets = .zero
      // 网页内左滑返回
      webView.allowsBackForwardNavigationGestures = true

        bridge.webView = webView
        
        // ✅ 只在这里加载一次
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
      return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }

    @MainActor
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {

      var parent: AXaixlkalAJxlpWebView
      var startTime: Date?

      init(_ parent: AXaixlkalAJxlpWebView) {
        self.parent = parent
      }
        
      // MARK: - 加载开始
      func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        startTime = Date()
        parent.onLoadingStart?()
      }

      // MARK: - 加载结束
      func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

        if let start = startTime {
          let duration = Int(Date().timeIntervalSince(start) * 1000)
          parent.onLoadingFinish?(duration)
        }
      }

        // MARK: - 外部 URL//2026.3.24(openBrowser事件修改)
        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
            if let url = navigationAction.request.url,
               let scheme = url.scheme?.lowercased(),
               scheme != "http" && scheme != "https" && scheme != "file" && scheme != "about" {
                UIApplication.shared.open(url, options: [:]) { [weak webView] success in
                    let state = success ? "success" : "failed"
                    let js = """
                    window.dispatchEvent(new CustomEvent('nativeOpenState', {
                        detail: { state: '\(state)', url: '\(url.absoluteString)' }
                    }));
                    """
                    DispatchQueue.main.async {
                        webView?.evaluateJavaScript(js, completionHandler: nil)
                    }
                }
                
                decisionHandler(.cancel)
                return
            }
            
            decisionHandler(.allow)
        }
        
        // 跳转商店
        func webView(
          _ webView: WKWebView,
          createWebViewWith configuration: WKWebViewConfiguration,
          for navigationAction: WKNavigationAction,
          windowFeatures: WKWindowFeatures
        ) -> WKWebView? {

            guard let url = navigationAction.request.url else { return nil }

            let urlString = url.absoluteString.lowercased()
            if url.scheme == "itms-apps"
                || url.scheme == "itms-services"
                || urlString.contains("apps.apple.com")
            {
                if let url = URL(string: urlString),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                } else {
                    print("No UPI app installed")
                }
                DispatchQueue.main.async {
                    UIApplication.shared.open(url)
                }
                return nil
            }
            webView.load(URLRequest(url: url))
            print(UIApplication.shared.canOpenURL(URL(string: "upi://pay")!))
            return nil
        }

        //权限弹框优化
      func webView(
        _ webView: WKWebView,
        requestMediaCapturePermissionFor origin: WKSecurityOrigin,
        initiatedByFrame frame: WKFrameInfo,
        type: WKMediaCaptureType,
        decisionHandler: @escaping (WKPermissionDecision) -> Void
      ) {
        decisionHandler(.grant)
      }

      // MARK: - JS 通信
      func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
      ) {

        if message.name == "rechargePay",
          let dict = message.body as? [String: Any],
          let orderCode = dict["orderCode"] as? String,
          let batchNo = dict["batchNo"] as? String
        {

          parent.onRecharge?(orderCode, batchNo)
        }

        if message.name == "Close" {
          parent.onClose?()
        }
          if message.name == "openBrowser" {

              var urlString: String?

              if let dict = message.body as? [String: Any] {
                  urlString = dict["url"] as? String
              } else if let str = message.body as? String {
                  urlString = str
              }

              guard let urlString else { return }

              parent.onopenBrowser?(urlString)
          }
           
      }

    }


}

class WebViewBridge: ObservableObject {
    weak var webView: WKWebView?
    
}//2026.3.24(openBrowser事件修改)

struct UEbzXNzaAgreement: View {
    let urbzlxxnWebUrl: String
    
    @EnvironmentObject var ueabvazjIpaWallet: IwhanxaIAPManager
    @EnvironmentObject var ureanxaXigNavi: UxzuaNaaviManer
    
    @State private var isLoading: Bool = true
    
    @StateObject private var bridge = WebViewBridge()//2026.3.24(openBrowser事件修改)
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            if WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB && !DwhaiXeuLoadingToast.shared.dwahuxnIsLoading {
                GeometryReader { geo in
                    Image("klahgw_guide_pabg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: .infinity)
                        .clipped()
                        .ignoresSafeArea()
                        
                }
                LinearGradient(colors: [
                    Color(red: 1, green: 68 / 255, blue: 182 / 255),
                    .white.opacity(0)
                ], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
            }
            VStack {
                if !WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB {
                    IEyabZHskTopBar()
                }
                
                AXaixlkalAJxlpWebView(
                    urlString: urbzlxxnWebUrl,
                    bridge: bridge,
                      onLoadingStart: {
                        isLoading = true
//                          DwhaiXeuHUD.showLoading()
                      },
                      onLoadingFinish: { duration in
//                          DwhaiXeuHUD.hideLoading()
                        isLoading = false
                          
                        if WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB {
                          Task {
                            try await GhsuqJduwApiCall()
                              .ghsuqJduwLoadingTimeRecord(duration)
                          }
                        }
                      },
                      onClose: {
                          WqigjxAkjjglriAppStorage.wqigjxAkjjglriUserToken = ""
            //              RaeyqZjxwaBInfoPer.saveUserToken("")
                          ureanxaXigNavi.popToRoot()
                      },
                      onRecharge: { orderCode, batchNo in
                        pwoaixAcxwisUsersOrdercode = orderCode
                        Task {
                            ueabvazjIpaWallet.bneualIWlaRecharge(batchNo){ status in
                                switch status {
                                case .success(let diamond):
                                    print("success")
                                case .cancelled:
                                    print("cancelled")
                                case .pending:
                                    print("pending")
                                case .failed(let message):
                                    print("failed: \(message)")
                                }
                            }
                        }
                      },
                    onopenBrowser: { urlString in
                        //打开原生浏览器事件//2026.3.24(openBrowser事件修改)
                        if let url = URL(string: urlString) {
                                
                                UIApplication.shared.open(url, options: [:]) { success in
                                    let state = success ? "success" : "failed"
                                    let js = """
                                        window.dispatchEvent(new CustomEvent('nativeOpenState', {
                                            detail: { state: '\(state)', url: '\(url.absoluteString)' }
                                        }));
                                        """
                                    DispatchQueue.main.async {
                                        bridge.webView?.evaluateJavaScript(js, completionHandler: nil)
                                    }
                                }
                            }
                    }
                ).ignoresSafeArea()
            }
            if DwhaiXeuLoadingToast.shared.dwahuxnIsLoading {

              VStack(spacing: 30) {
                  Spacer()
                ProgressView()
                  .scaleEffect(1.5)
                  .tint(.white)

                Text("loading...")
                      .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                  .foregroundColor(.white)
              }
              .padding(.bottom, 100)
            }
        }.navigationBarHidden(true)
            .background(
                Group{
                    if !WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB {
                        XiwanEnableSwipeBack()
                    }

                }).protectScreenshot()  // Protect the view
            .ignoresSafeArea()
            .onAppear {
              ScreenShield.shared.protectFromScreenRecording()  // Protect Screen-Recording
            }
    }
}
