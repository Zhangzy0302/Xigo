import SwiftUI

struct AOjxeuALVideoChat: View {
    let aojuexChatUserID: Int
    @EnvironmentObject var aoixjaNavi: UxzuaNaaviManer
    @EnvironmentObject var aojuxeuUserVM: XawuxLAiwMUSerViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            GeometryReader { geo in
                VStack{
                    if let aoujChatUserInfo = aojuxeuUserVM.returnXawuxLAiwMUserInfoById(userId: aojuexChatUserID) {
                        IEyabZHskTopBar()
                        
                        ZStack{
                            Circle()
                                .fill(.white.opacity(0.3))
                                .frame(width: 166, height: 166)
                            Circle()
                                .fill(XigexcTheme.XigoColor.xiabalMainPurple)
                                .frame(width: 144, height: 144)
                            SkahwuLwXImage(SkahwuLwXImageUrl: aoujChatUserInfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 138, SkahwuLwXHeight: 138)
                                .clipShape(Circle())
                        }.padding(.top, geo.size.height * 0.15)
                        VStack(spacing: 10){
                            Text(aoujChatUserInfo.xawuxLAiwMUserName)
                                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                                .foregroundStyle(.black)
                            Text("Calling")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(10, weight: .regular))
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                    Image("cujhelruAj")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            aoixjaNavi.pop()
                        }
                        .padding(.bottom, 68)
                }
            }
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
    }
}
