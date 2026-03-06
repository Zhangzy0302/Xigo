import SwiftUI

enum UxzuaAppRoute: Hashable {
    // guide
    case weytqxzSignPage
    case uebzdxnzAgreement(uehvzUrl: String)
    
    // user
    case bnzjsjaAkUserPage
    case oeuqunAlkjSetting
    case wxznWyUserList
    case kahxuwaofWallet
    
    // video
    case rpuqxAlkSharing
    case uWxnazaAkalVideoDetail
    case czlsiwPostVideo
    
    // cos post
    case nabzjakALdaCosSharing
    
    // chat
    case tudaaWLjMessagePage
    case mznajucChatRoom
}

struct UxzuaXigoRouterStack: View {
    @EnvironmentObject private var uxaiznNaviManner: UxzuaNaaviManer
    @EnvironmentObject private var uxzauUser: XawuxLAiwMUSerViewModel
    
    var body: some View {
        NavigationStack(path: $uxaiznNaviManner.uzszuPath) {
            Group {
                if uxzauUser.currentUser != nil {
                    VbwualMAuwaHome()
                }else{
                    TrwyquGuidePage()
                }
            }
                .navigationDestination(for: UxzuaAppRoute.self) { route in
                    switch route {
                    // guide
                    case .weytqxzSignPage:
                        WeytqxzSignPage()
                    case .uebzdxnzAgreement(let uehvzUrl):
                        UEbzXNzaAgreement(urbzlxxnWebUrl: uehvzUrl)
                        
                    // user
                    case .bnzjsjaAkUserPage:
                        BnzjsjaAKwUserPage()
                    case .oeuqunAlkjSetting:
                        OeuqnAhldSetting()
                    case .wxznWyUserList:
                        WxznaWYaUserList()
                    case .kahxuwaofWallet:
                        KahxuwaofWallet()
                        
                    // video
                    case .czlsiwPostVideo:
                        CzlsiwPostVideo()
                    case .rpuqxAlkSharing:
                        RPuqxAldkSharing()
                    case .uWxnazaAkalVideoDetail:
                        UWxnaAKalVideoDetail()
                        
                    // cos post
                    case .nabzjakALdaCosSharing:
                        NVbzajaAldaCosShare()
                        
                    // chat
                    case .mznajucChatRoom:
                        MznaujucChatRoom()
                    case .tudaaWLjMessagePage:
                        TudaaWLjMessagePage()
                    }
                }
        }
    }
}

class UxzuaNaaviManer: ObservableObject {
    // 核心：全局共享的导航路径
    @Published var uzszuPath: NavigationPath = NavigationPath()
    @Published var uzlnaiIsShowDialog: Bool = false
    
    // 便捷方法：跳转到指定路由
    func push(_ route: UxzuaAppRoute) {
        uzszuPath.append(route)
    }
    
    // 便捷方法：返回上一页
    func pop() {
        uzszuPath.removeLast()
    }
    
    // 便捷方法：返回根页面
    func popToRoot() {
        uzszuPath.removeLast(uzszuPath.count)
    }

}
