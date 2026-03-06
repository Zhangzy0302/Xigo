import SwiftUI

struct VbwualMAuwaHome: View {
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
                    HStack(spacing: 10) {
                        ZStack {
                            Image("cponlzna_avatar_round")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        StrokeText(text: "Hello！Amy", width: 2)
                            .transformEffect(.init(a: 1, b: 0, c: -0.25, d: 1, tx: 0, ty: 0))
                            
                        Spacer()
                        Image("klahgw_message_bell")
                            .resizable()
                            .frame(width: 42, height: 42)
                    }.padding(.horizontal, 20)
                    
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
                                InfiniteCarouselView()
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
        
        
    }
}

import ACarousel

struct InfiniteCarouselView: View {
    
    let items: [String] = [
        "suwnAakuro231as",
        "sxna27dj37a",
        "s81hkjsa72ha"
    ]
    @State private var currentIndex: Int = 1
    
    var body: some View {
        
        ACarousel(items, id: \.self, spacing: 10, isWrap: true) { item in
            Image(item)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 210)
            }
            .frame(height: 400)
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

#Preview {
    VbwualMAuwaHome()
}
