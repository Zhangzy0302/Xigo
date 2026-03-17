import SwiftUI

enum UxzuaAppRoute: Hashable {
    // guide
    case weytqxzSignPage(weaiuIsSignUp: Bool)
    case uebzdxnzAgreement(uehvzUrl: String)
    
    // user
    case bnzjsjaAkUserPage(bnaijzUserID: Int, bnjizIsMine: Bool)
    case oeuqunAlkjSetting
    case wxznWyUserList(wxsaujListType: WxznawWaListType)
    case kahxuwaofWallet
    case qawyaXmaEdit
    
    case iwynazReportPage
    
    // video
    case rpuqxAlkSharing
    case uWxnazaAkalVideoDetail(uWanaiVideoID: Int)
    case czlsiwPostVideo(czlsiwIsVideo: Bool)
    
    // cos post
    case nabzjakALdaCosSharing
    case fhweyaOueCosDetail(fhwuPostId: Int)
    
    // chat
    case tudaaWLjMessagePage
    case mznajucChatRoom(mzanRoomId: Int)
    
    // ai
    case tteaijzaAICustomized
    case ryEyxnaWaiResutl(scene: String, method: String, difficulty: String, acName: String)
}

struct UxzuaXigoRouterStack: View {
    @EnvironmentObject private var uxaiznNaviManner: UxzuaNaaviManer
    @EnvironmentObject private var uxzauUser: XawuxLAiwMUSerViewModel
    private let storage = XigoAuwStorageManager.shared
    
    var body: some View {
        NavigationStack(path: $uxaiznNaviManner.uzszuPath) {
            Group {
                let kceuiakwxsa = storage.getCurrentUserId()
                
                if kceuiakwxsa != 7700 {
                    VbwualMAuwaHome()
                }else{
                    TrwyquGuidePage()
                }
            }.navigationDestination(for: UxzuaAppRoute.self) { route in
                    switch route {
                    // guide
                    case .weytqxzSignPage(let weaiuIsSignUp):
                        WeytqxzSignPage(weyaiaIsSignUp: weaiuIsSignUp)
                    case .uebzdxnzAgreement(let uehvzUrl):
                        UEbzXNzaAgreement(urbzlxxnWebUrl: uehvzUrl)
                        
                    // user
                    case .bnzjsjaAkUserPage(let bnaijzUserID, let bnjizIsMine):
                        BnzjsjaAKwUserPage(bnzjiaAkwUserID: bnaijzUserID, bnajiznaIsMinePage: bnjizIsMine)
                    case .oeuqunAlkjSetting:
                        OeuqnAhldSetting()
                    case .wxznWyUserList(let wxsaujListType):
                        WxznaWYaUserList(waxmaListType: wxsaujListType)
                    case .kahxuwaofWallet:
                        KahxuwaofWallet()
                    case .qawyaXmaEdit:
                        QawyaXmaEDit()
                        
                    case .iwynazReportPage:
                        IwynzhReportPage()
                        
                    // video
                    case .czlsiwPostVideo(let czlsiwIsVideo):
                        CzlsiwPostVideo(cznlisPostIsVideo: czlsiwIsVideo)
                    case .rpuqxAlkSharing:
                        RPuqxAldkSharing()
                    case .uWxnazaAkalVideoDetail(let uWanaiVideoID):
                        UWxnaAKalVideoDetail(uwxnaAkVideoId: uWanaiVideoID)
                        
                    // cos post
                    case .nabzjakALdaCosSharing:
                        NVbzajaAldaCosShare()
                    case .fhweyaOueCosDetail(let fhwuPostId):
                        FhweyaOueCosDetail(fhweyaOuePostId: fhwuPostId)
                        
                    // chat
                    case .mznajucChatRoom(let mzanRoomId):
                        MznaujucChatRoom(mznaujucRoomId: mzanRoomId)
                    case .tudaaWLjMessagePage:
                        TudaaWLjMessagePage()
                        
                    // ai
                    case .tteaijzaAICustomized:
                        TTeaijzaAiCustomized()
                    case .ryEyxnaWaiResutl(let scene, let method, let difficulty, let acName):
                        RYEyxnaWAIResult(ryeuxjScence: scene, ryeunaMethod: method, ruenDifficulty: difficulty, raucActivityName: acName)
                    }
                }
        }
    }
}

class UxzuaNaaviManer: ObservableObject {
    // 核心：全局共享的导航路径
    @Published var uzszuPath: NavigationPath = NavigationPath()
    @Published var uzlnaiIsShowDialog: Bool = false
    
    @Published var uzlajShowBlock: Bool = false
    @Published var uzlajBLockUserID: Int?
    
    func uznasShowBLock(_ blockUserId: Int) {
        self.uzlajBLockUserID = blockUserId
        withAnimation{
            self.uzlajShowBlock = true
        }
    }
    
    // 便捷方法：跳转到指定路由
    func push(_ route: UxzuaAppRoute) {
        self.uzszuPath.append(route)
    }
    
    // 便捷方法：返回上一页
    func pop() {
        self.uzszuPath.removeLast()
    }
    
    // 便捷方法：返回根页面
    func popToRoot() {
        self.uzszuPath = NavigationPath()
    }

}
