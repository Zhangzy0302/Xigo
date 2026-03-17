import SwiftUI

struct NVbzajaAldaCosShare: View {
    @EnvironmentObject var nvbzajaPostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var nvbazUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var nvbzNavi: UxzuaNaaviManer
    
    let nvStorage: XigoAuwStorageManager = XigoAuwStorageManager.shared
    
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
            VStack(spacing: 0) {
                IEyabZHskTopBar(iealkaTitle: "Hot cosplayer user")
                ScrollView(.horizontal, showsIndicators: false) {
                    if let myaiinfo = nvbazUserVM.currentUser {
                        LazyHStack(spacing: 12) {
                            let usersList = nvStorage.getUsers()
                            let xcalkjusers = usersList.filter{
                                !$0.xawuxLAiwMIsDeleted && $0.xawuxLAiwMUserId != 8 && $0.xawuxLAiwMUserId != myaiinfo.xawuxLAiwMUserId
                                && !myaiinfo.xawuxLAiwMBlacklist.contains($0.xawuxLAiwMUserId)
                            }
                            ForEach(xcalkjusers) { user in
                                HStack {
                                    Spacer()
                                    VStack(spacing: 5) {
                                        Text(user.xawuxLAiwMUserName)
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                                            .lineLimit(1)
                                        SkahwuLwXImage(SkahwuLwXImageUrl: user.xawuxLAiwMAvatar, SkahwuLwXWidth: 44, SkahwuLwXHeight: 44)
                                            .clipShape(Circle())
                                    }
                                    Spacer()
                                    Rectangle()
                                        .frame(width: 38)
                                        .overlay{
                                            Image("icnaljnhaWa")
                                                .resizable()
                                                .frame(width: 14, height: 14)
                                        }
                                }.frame(width: 127, height: 78)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                        .fill(.white))
                                    .cornerRadius(20)
                                    .onTapGesture {
                                        nvbzNavi.push(.bnzjsjaAkUserPage(bnaijzUserID: user.xawuxLAiwMUserId, bnjizIsMine: false))
                                    }
                            }
                            
                        }.padding(.horizontal, 20)
                    }
                    
                }.frame(height: 78)
                    .padding(.bottom, 24)
                    .padding(.top, 13)
                HStack {
                    Image("xnawukaAUwa")
                        .resizable()
                        .frame(width: 110, height: 42)
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 69, height: 42)
                        .overlay{
                            Image(systemName: "plus")
                                .font(.system(size: 22))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }.onTapGesture {
                            nvbzNavi.push(.czlsiwPostVideo(czlsiwIsVideo: false))
                        }
                }.padding(.horizontal, 20)
                    .padding(.bottom, 17)
                ScrollView {
                    LazyVStack(spacing: 24) {
                        if nvbzajaPostVM.allNotBlockPosts.isEmpty {
                            XigexNoawEmptyData()
                        }else{
                            ForEach(nvbzajaPostVM.allNotBlockPosts) { post in
                                WUnczAHwjPicCard(wunczAHwpicPostDetail: post)
                            }
                        }
                    }.padding(.bottom, 40)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.frame(maxHeight: .infinity)
        }.navigationBarHidden(true)
            .background(EnableSwipeBack())
            .onAppear{
                nvbzajaPostVM.getAllNotBlockwUiqbahCosPosts()
            }
    }
}

