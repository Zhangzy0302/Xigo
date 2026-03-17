import SwiftUI

enum WxznawWaListType {
    case wlnzFollowing
    case wianlaFans
    case xiwaBlacklsit
}

struct WxznaWYaUserList: View {
    @EnvironmentObject var wuaUSerVm: XawuxLAiwMUSerViewModel
    let waxmaListType: WxznawWaListType
    
    func iwanItitle() -> String {
        switch waxmaListType {
        case .wlnzFollowing:
            return "Follow"
        case .wianlaFans:
            return "Fan"
        case .xiwaBlacklsit:
            return "Blacklist"
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            VStack(spacing: 20) {
                IEyabZHskTopBar(iealkaTitle: iwanItitle())
                if let wuznxaMyInfo = wuaUSerVm.currentUser {
                    ScrollView {
                        switch waxmaListType {
                        case .wlnzFollowing:
                            LazyVStack(spacing: 20) {
                                ForEach(wuznxaMyInfo.xawuxLAiwMFollowing, id: \.self) { userID in
                                    WxzanauWyaUserItem(wayaUserId: userID) {
                                        Button(action: {
                                            wuaUSerVm.toggleXawuxLAiwMUserIsFollowed(followUserId: userID)
                                        }) {
                                            Color.black.frame(width: 77, height: 31)
                                                .cornerRadius(20)
                                                .overlay{
                                                    Text(wuznxaMyInfo.xawuxLAiwMFollowing.contains(userID) ? "Unfollow" : "Follow")
                                                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                                        .foregroundColor(.white)
                                                }
                                        }
                                    }
                                }
                            }.padding(.bottom, 40)
                        case .wianlaFans:
                            LazyVStack(spacing: 20) {
                                ForEach(wuznxaMyInfo.xawuxLAiwMFans, id: \.self) { userID in
                                    WxzanauWyaUserItem(wayaUserId: userID) {
                                        Button(action: {
                                            wuaUSerVm.toggleXawuxLAiwMUserIsFollowed(followUserId: userID)
                                        }) {
                                            Color.black.frame(width: 77, height: 31)
                                                .cornerRadius(20)
                                                .overlay{
                                                    Text(wuznxaMyInfo.xawuxLAiwMFollowing.contains(userID) ? "Unfollow" : "Follow")
                                                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                                        .foregroundColor(.white)
                                                }
                                        }
                                    }
                                }
                            }.padding(.bottom, 40)
                        case .xiwaBlacklsit:
                            LazyVStack(spacing: 20) {
                                ForEach(wuznxaMyInfo.xawuxLAiwMBlacklist, id: \.self) { userID in
                                    WxzanauWyaUserItem(wayaUserId: userID) {
                                        Button(action: {
                                            wuaUSerVm.toggleUserIsBlocked(blockUserId: userID)
                                        }) {
                                            Color.black.frame(width: 102, height: 31)
                                                .cornerRadius(20)
                                                .overlay{
                                                    Text("Cancel")
                                                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                                        .foregroundColor(.white)
                                                }
                                        }
                                            
                                            
                                    }
                                }
                            }.padding(.bottom, 40)
                        }
                        
                    }
                }
                
            }
            
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
            .onAppear{
                wuaUSerVm.loadLoginXawuxLAiwMUser()
            }
    }
    
    struct WxzanauWyaUserItem<Button: View>: View {
        let wayaUserId: Int
        let wxauButton: () -> Button
        
        @EnvironmentObject var wuaUSerVm: XawuxLAiwMUSerViewModel
        
        var body: some View {
            HStack(spacing: 12){
                if let wauaqUSerInfo = wuaUSerVm.returnXawuxLAiwMUserInfoById(userId: wayaUserId){
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .frame(width: 60,height: 60)
                        .overlay{
                            SkahwuLwXImage(SkahwuLwXImageUrl: wauaqUSerInfo.xawuxLAiwMAvatar,   SkahwuLwXWidth: 50,
                                           SkahwuLwXHeight: 50,
                                           SkahwuLwXIsCircle: true,
                                           SkahwuLwXCircleColor: .black,
                                           SkahwuLwXCircleWidth: 2)
                        }
                    Text(wauaqUSerInfo.xawuxLAiwMUserName)
                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .extraBold))
                }
                
                Spacer()
                wxauButton()
            }.padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white.opacity(0.2))
                    
                        
                ).padding(.horizontal, 20)
        }
    }
}
