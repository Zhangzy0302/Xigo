import SwiftUI
import WebKit

struct AXaixlkalAJxlpWebView: UIViewRepresentable {

  let urlString: String

  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {
    guard let url = URL(string: urlString) else { return }
    let request = URLRequest(url: url)
    webView.load(request)
  }

}

struct UEbzXNzaAgreement: View {
    let urbzlxxnWebUrl: String
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                IEyabZHskTopBar()
                AXaixlkalAJxlpWebView(urlString: urbzlxxnWebUrl)
            }
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
    }
}
