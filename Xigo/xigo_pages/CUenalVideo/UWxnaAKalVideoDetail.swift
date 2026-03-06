import SwiftUI

struct UWxnaAKalVideoDetail: View {
    @State private var wuanxaTExt: String = ""
    @FocusState private var wainFocus: Bool
    
    @State private var uwnaxIsShowCOOcmet: Bool = false
    
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
            VStack {
                IEyabZHskTopBar(iealkaTitle: "Video")
                GeometryReader { geo in
                    ZStack(alignment: .top) {
                        // 刘海屏形状
                        OAjdsaCneScreenShape(notchDepth: 30)
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
                            .shadow(radius: 10)
                            .overlay{
                                VStack {
                                    RoundedRectangle(cornerRadius: 40)
                                        .padding(.horizontal, 20)
                                    HStack(spacing: 11) {
                                        HStack {
                                            TextField("", text: $wuanxaTExt)
                                                .focused($wainFocus)
                                            Image("klahgw_send")
                                                .resizable()
                                                .frame(width: 34, height: 34)
                                        }.padding(6)
                                            .background(
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(.white)
                                                .overlay{
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .stroke(XigexcTheme.XigoColor.xiabalPinkPurpleGradient, lineWidth: 1)
                                                }
                                        )
                                        HStack(spacing: 12){
                                            Image("klahgw_heart")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                            Image("klahgw_comment")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .onTapGesture{
                                                    uwnaxIsShowCOOcmet = true
                                                }
                                            Image("klahgw_aiwna")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                            
                                        }
                                        
                                            
                                    }.padding(.horizontal, 20)
                                        .padding(.top, 16)
                                        .padding(.bottom, 28)
                                        .background{
                                            UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 20)
                                        }
                                }.padding(.top, 40)
                            }
                        
                        // 顶部横条
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.white)
                            .frame(width: 35.5, height: 1)
                    }
                }
            }.ignoresSafeArea(edges: .bottom)
            
            
        }.onTapGesture {
            wainFocus = false
        }.overlay{
            HGhauwComment(hghaIsShowCOmment: $uwnaxIsShowCOOcmet)
        }.navigationBarHidden(true)
    }
}

#Preview {
    UWxnaAKalVideoDetail()
}
