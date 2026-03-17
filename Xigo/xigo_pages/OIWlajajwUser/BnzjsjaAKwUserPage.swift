import SwiftUI

struct BnzjsjaAKwUserPage: View {
    let bnzjiaAkwUserID: Int
    let bnajiznaIsMinePage: Bool
    @EnvironmentObject var bnzjiakaUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var bnzjaiVideoVM: ErwyAuwVideoViewModel
    @EnvironmentObject var bnjaziaPostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var bnzjiaNavi: UxzuaNaaviManer
    
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
            if let bnzjasUserInfo = bnzjiakaUserVM.userInfo {
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack(alignment: .top) {
                            Image("reuqojnxAj")
                                .resizable()
                                .frame(height: 157)
                                .overlay{
                                    VStack(spacing: 0) {
                                        if bnajiznaIsMinePage {
                                            HStack{
                                                Spacer()
                                                Image("klahgw_edit_info")
                                                    .resizable()
                                                    .frame(width: 22, height: 22)
                                                    .onTapGesture {
                                                        bnzjiaNavi.push(.qawyaXmaEdit)
                                                    }
                                            }
                                        }
                                        
                                        Spacer()
                                        Text(bnzjasUserInfo.xawuxLAiwMUserName)
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(24, weight: .black))
                                            .padding(.bottom, 8)
                                        HStack(spacing: 27){
                                            VStack(spacing: 6){
                                                Text("\(bnzjasUserInfo.xawuxLAiwMFollowing.count)")
                                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .bold))
                                                    .foregroundColor(.white)
                                                Text("Follow")
                                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: 132, height: 58)
                                            .background(RoundedRectangle(cornerRadius: 10))
                                            .onTapGesture {
                                                if bnajiznaIsMinePage {
                                                    bnzjiaNavi.push(UxzuaAppRoute.wxznWyUserList(wxsaujListType: .wlnzFollowing))
                                                }
                                                
                                            }
                                            VStack(spacing: 6){
                                                Text("\(bnzjasUserInfo.xawuxLAiwMFans.count)")
                                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .bold))
                                                    .foregroundColor(.white)
                                                Text("Fan")
                                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: 132, height: 58)
                                            .background(RoundedRectangle(cornerRadius: 10))
                                            .onTapGesture {
                                                if bnajiznaIsMinePage {
                                                    bnzjiaNavi.push(UxzuaAppRoute.wxznWyUserList(wxsaujListType: .wianlaFans))
                                                }
                                                
                                            }
                                        }
                                    }.padding(.horizontal, 16)
                                        .padding(.vertical, 15)
                                }
                                .padding(.top, 68)
                            Circle()
                                .stroke(.white.opacity(0.7), lineWidth: 1)
                                .frame(width: 98, height: 98)
                                .overlay{
                                    SkahwuLwXImage(SkahwuLwXImageUrl: bnzjasUserInfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 82, SkahwuLwXHeight: 82, SkahwuLwXIsCircle: true, SkahwuLwXCircleColor: .white, SkahwuLwXCircleWidth: 2)
                                        
                                }
                        }.padding(.horizontal, 20)
                        
                        if (bnajiznaIsMinePage || bnzjiaAkwUserID != bnzjiakaUserVM.currentUserID){
                            BnazWalletOrButtons(bnajiznaIsMinePage: bnajiznaIsMinePage, bnzjasUserInfo: bnzjasUserInfo)
                        }
                        
                        
                        BnzjaisBottomWorks(bnzjiaAkwUserID: bnzjiaAkwUserID)
                    }.ignoresSafeArea(edges: .bottom)
                }
            }
            
            IEyabZHskTopBar() {
                Group {
                    if bnajiznaIsMinePage {
                        Image("klahgw_icon_setting")
                            .resizable()
                            .frame(width: 42, height: 42)
                            .onTapGesture {
                                bnzjiaNavi.push(UxzuaAppRoute.oeuqunAlkjSetting)
                            }
                    }else if (bnzjiaAkwUserID != bnzjiakaUserVM.currentUser?.xawuxLAiwMUserId){
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 42, height: 42)
                            .background(Circle().fill(.white.opacity(0.2)))
                            .onTapGesture {
                                bnzjiaNavi.uznasShowBLock(bnzjiaAkwUserID)
                            }
                    }else{
                        Spacer()
                    }
                }
                
            }
        }.navigationBarHidden(true)
            .background(EnableSwipeBack())
            .onAppear{
                bnzjiakaUserVM.getXawuxLAiwMUserInfoByUid(uid: bnzjiaAkwUserID)
            }
    }
    
    struct BnazWalletOrButtons: View {
        let bnajiznaIsMinePage: Bool
        let bnzjasUserInfo: XawuxLAiwMUSer
        
        @EnvironmentObject var bnajxUserVM: XawuxLAiwMUSerViewModel
        @EnvironmentObject var bnzjiaNavi: UxzuaNaaviManer
        @EnvironmentObject var bnzjaChatVM: SswzuLwoqxChatViewModel
        
        var body: some View {
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.2))
                    .frame(height: 67)
                    .padding(.horizontal, 29)
                    .padding(.top, 4)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.5))
                    .frame(height: 61)
                    .padding(.horizontal, 11)
                    .padding(.top, 4)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(height: 59)
                    .overlay{
                        if (bnajiznaIsMinePage) {
                            
                            HStack{
                                Image("XJHwuyalsa")
                                    .resizable()
                                    .frame(width: 107, height: 36)
                                Spacer()
                                HStack(spacing: 12){
                                    Image("klahgw_coin")
                                        .resizable()
                                        .frame(width: 24, height: 27)
                                    Text("\(bnzjasUserInfo.xawuxLAiwMWalletBalance)")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                                        .foregroundColor(.black)
                                }.padding(.trailing, 30)
                            }.padding(.horizontal, 12)
                        }else {
                            HStack(spacing: 34){
                                let bnaIsFollowed = bnajxUserVM.currentUser!.xawuxLAiwMFollowing.contains(bnzjasUserInfo.xawuxLAiwMUserId)
                                XigexcTheme.XigoColor.xiabalMainPurple
                                    .frame(height: 42)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(14)
                                    .shadow(color: .black, radius: 0, y: 2)
                                    .overlay{
                                        Text(bnaIsFollowed ? "Unfollow" : "Following")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                                            .foregroundColor(.white)
                                    }.onTapGesture {
                                        bnajxUserVM.toggleXawuxLAiwMUserIsFollowed(followUserId: bnzjasUserInfo.xawuxLAiwMUserId)
                                        bnajxUserVM.getXawuxLAiwMUserInfoByUid(uid: bnzjasUserInfo.xawuxLAiwMUserId)
                                    }
                                Spacer()
                                XigexcTheme.XigoColor.xiabalMainPink
                                    .frame(height: 42)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(14)
                                    .shadow(color: .black, radius: 0, y: 2)
                                    .overlay{
                                        Text("Chat")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                                            .foregroundColor(.white)
                                    }.onTapGesture {
                                        let bnzjMatchRoom = bnzjaChatVM.findOrCreateSswzuLwoqxChatRoom(chatUserId: bnzjasUserInfo.xawuxLAiwMUserId)
                                        bnzjiaNavi.push(.mznajucChatRoom(mzanRoomId: bnzjMatchRoom.sswzuLwoqxRoomId))
                                    }
                            }.padding(.horizontal, 10)
                        }
                    }
            }.onTapGesture {
                if bnajiznaIsMinePage {
                    bnzjiaNavi.push(.kahxuwaofWallet)
                }
                
            }
            .padding(.horizontal, 20)
                .padding(.top, 28)
                
        }
    }
    
    struct BnzjaisBottomWorks: View {
        let bnzjiaAkwUserID: Int
        @State private var bnazjiaCurrentIsPosts: Bool = true
        
        @EnvironmentObject var bnzjiakaUserVM: XawuxLAiwMUSerViewModel
        @EnvironmentObject var bnzjaiVideoVM: ErwyAuwVideoViewModel
        @EnvironmentObject var bnjaziaPostVM: WUiqbahCosPostsViewModel
        var body: some View {
            VStack(alignment: .leading){
                HStack(spacing: 16){
                    Text("Posts")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                        .foregroundColor(bnazjiaCurrentIsPosts ? .black : Color(red: 102/255, green: 102/255, blue: 102/255))
                        .onTapGesture {
                            bnazjiaCurrentIsPosts = true
                        }
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 4, height: 15)
                    Text("Videos")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                        .foregroundColor(!bnazjiaCurrentIsPosts ? .black : Color(red: 102/255, green: 102/255, blue: 102/255))
                        .onTapGesture {
                            bnazjiaCurrentIsPosts = false
                        }
                    Spacer()
                }.padding(.horizontal, 20)
                    .padding(.bottom, 20)
                Group {
                    if bnazjiaCurrentIsPosts {
                        LazyVStack {
                            let useraPosts = bnjaziaPostVM.getUiqbahCosPostsByUserId(bnzjiaAkwUserID)
                            if useraPosts.isEmpty {
                                XigexNoawEmptyData()
                            } else {
                                ForEach(useraPosts) { post in
                                    WUnczAHwjPicCard(wunczAHwpicPostDetail: post)
                                }
                            }
                            
                        }.padding(.bottom, 40)
                    }else {
                        LazyVStack(spacing: 20) {
                            let userVideos = bnzjaiVideoVM.getErwyAuwWorksByUserId(userId: bnzjiaAkwUserID)
                            if userVideos.isEmpty {
                                XigexNoawEmptyData()
                            }else {
                                ForEach(userVideos) { videoItem in
                                    PeuqZNhsgaVideoCard(peuqZnhasaVideoItem: videoItem)
                                }
                            }
                            
                        }.padding(.bottom, 40)
                    }
                    
                    
                }
            }.padding(.top, 24)
        }
    }
}
