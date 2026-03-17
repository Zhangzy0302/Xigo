import SwiftUI

struct VbwualMAuwaHome: View {
    @EnvironmentObject var vbwaljUserVm: XawuxLAiwMUSerViewModel
    @EnvironmentObject var vbwalPathNavi: UxzuaNaaviManer
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                VStack{
                    ZStack(alignment: .top) {
                        ZStack(alignment: .bottomTrailing) {
                            Image("cjwkJAjshwao")
                                .resizable()
                                .frame(height: 131)
                            Image("kdjaoiwmSUWa")
                                .resizable()
                                .frame(width: 160, height: 195)
                                .padding(.bottom, 13)
                            
                        }.padding(.horizontal, 20)
                            .padding(.top, 26)
                        if let vbwaulCurrentUserInfo = vbwaljUserVm.currentUser {
                            HStack(spacing: 10) {
                                ZStack {
                                    SkahwuLwXImage(SkahwuLwXImageUrl: vbwaulCurrentUserInfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 54, SkahwuLwXHeight: 54)
                                        .clipShape(Circle())
                                        .padding(.trailing, 2)
                                    Image("cponlzna_avatar_round")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                }.onTapGesture {
                                    vbwalPathNavi.push(UxzuaAppRoute.bnzjsjaAkUserPage(bnaijzUserID: vbwaulCurrentUserInfo.xawuxLAiwMUserId, bnjizIsMine: true))
                                }
                                StrokeText(text: "Hello！\(vbwaulCurrentUserInfo.xawuxLAiwMUserName)", width: 2)
                                    .transformEffect(.init(a: 1, b: 0, c: -0.25, d: 1, tx: 0, ty: 0))
                                    
                                Spacer()
                                Image("klahgw_message_bell")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                    .onTapGesture {
                                        vbwalPathNavi.push(UxzuaAppRoute.tudaaWLjMessagePage)
                                    }
                            }.padding(.horizontal, 20)
                        }
                        
                        
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .top) {
                            // 刘海屏形状
                            OAjdsaCneScreenShape()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white,
                                            Color(red: 1.0, green: 0.92, blue: 0.96)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(maxHeight: .infinity)
                                .shadow(radius: 10)
                                .overlay{
                                    InfiniteCarouselView(carouselItemHeight: max(geo.size.height - 100, 0), carousejWidth: geo.size.width)
                                        .frame(height: max(geo.size.height - 80, 0))
                                }
                            
                            // 顶部横条
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 56, height: 2)
                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            }
                    }
                }.ignoresSafeArea(edges: .bottom)
            }
            
        }.navigationBarHidden(true)
        
    }
}

import ACarousel

struct InfiniteCarouselView: View {
    let carouselItemHeight: CGFloat
    let carousejWidth: CGFloat
    @EnvironmentObject var vbaijkNavi: UxzuaNaaviManer
    
    let items: [String] = [
        "suwnAakuro231as",
        "sxna27dj37a",
        "s81hkjsa72ha"
    ]
    @State private var currentIndex: Int = 1
    
    var body: some View {
        
        ACarousel(items, id: \.self,
                  spacing: 30,
                  headspace: 75,
                  sidesScaling: 0.9,  // 边缘项目的缩放比例
                  isWrap: true,
                  autoScroll: ACarouselAutoScroll.active(8)) { item in
            Image(item)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: carousejWidth * 0.43)
                    .onTapGesture {
                        switch(item) {
                        case "suwnAakuro231as":
                            vbaijkNavi.push(UxzuaAppRoute.rpuqxAlkSharing)
                        case "sxna27dj37a":
                            vbaijkNavi.push(UxzuaAppRoute.nabzjakALdaCosSharing)
                        case "s81hkjsa72ha":
                            vbaijkNavi.push(UxzuaAppRoute.tteaijzaAICustomized)
                        default:
                            return
                        }
                    }
        }
    }
    
}


struct StrokeText: View {
    let text: String
    let width: CGFloat

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }.font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
            .foregroundStyle(
                XigexcTheme.XigoColor.xiabalPinkPurpleGradient
                )
            Text(text).font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                .foregroundColor(.white)
        }
    }
}
