import SwiftUI

struct RPuqxAldkSharing: View {
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
            VStack {
                IEyabZHskTopBar(iealkaTitle: "Video Sharing")
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
                            .frame(width: 400, height: 850)
                            .shadow(radius: 10)
                            .overlay{
                                ScrollView {
                                    LazyVStack {
                                        PeuqZNhsgaVideoCard()
                                    }.padding(.bottom, 40)
                                }.padding(.top, 40)
                            }
                        
                        // 顶部横条
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.white)
                            .frame(width: 35.5, height: 1)
                    }
                }
                
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    RPuqxAldkSharing()
}
