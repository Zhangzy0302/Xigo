import SwiftUI

struct BnzjsjaAKwUserPage: View {
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
                ZStack(alignment: .top) {
                    Image("reuqojnxAj")
                        .resizable()
                        .frame(height: 157)
                        .overlay{
                            VStack(spacing: 0) {
                                HStack{
                                    Spacer()
                                    Image("klahgw_edit_info")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                }
                                Spacer()
                                Text("Amy")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(24, weight: .black))
                                    .padding(.bottom, 8)
                                HStack(spacing: 27){
                                    VStack(spacing: 6){
                                        Text("3.3w")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .bold))
                                            .foregroundColor(.white)
                                        Text("Follow")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 132, height: 58)
                                    .background(RoundedRectangle(cornerRadius: 10))
                                    VStack(spacing: 6){
                                        Text("3.3w")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .bold))
                                            .foregroundColor(.white)
                                        Text("Fan")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 132, height: 58)
                                    .background(RoundedRectangle(cornerRadius: 10))
                                }
                            }.padding(.horizontal, 16)
                                .padding(.vertical, 15)
                        }
                        .padding(.top, 68)
                    Circle()
                        .fill(.clear)
                        .frame(width: 98, height: 98)
                        .overlay{
                            Circle()
                                .stroke(.white.opacity(0.7), lineWidth: 1)
                        }
                }.padding(.horizontal, 20)
                
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
                            HStack{
                                Image("XJHwuyalsa")
                                    .resizable()
                                    .frame(width: 107, height: 36)
                                Spacer()
                                HStack(spacing: 12){
                                    Image("klahgw_coin")
                                        .resizable()
                                        .frame(width: 24, height: 27)
                                    Text("9999")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                                        .foregroundColor(.black)
                                }.padding(.trailing, 30)
                            }.padding(.horizontal, 12)
                        }
                }.padding(.horizontal, 20)
                    .padding(.top, 28)
                    .padding(.bottom, 24)
                
                HStack(spacing: 16){
                    Text("Posts")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                        .foregroundColor(.black)
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 4, height: 15)
                    Text("Videos")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.horizontal, 20)
                    .padding(.bottom, 20)
                GeometryReader { geo in
                    TabView {
                        ScrollView {
                            LazyVStack {
                                WUnczAHwjPicCard()
                            }
                        }
                        ScrollView {
                            LazyVStack {
                                PeuqZNhsgaVideoCard()
                            }
                        }
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                }
            }.ignoresSafeArea(edges: .bottom)
            IEyabZHskTopBar() {
                Image("klahgw_icon_setting")
                    .resizable()
                    .frame(width: 42, height: 42)
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    BnzjsjaAKwUserPage()
}
