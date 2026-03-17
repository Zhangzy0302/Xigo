import SwiftUI

struct RPuqxAldkSharing: View {
    @EnvironmentObject var rPuaqunVideoVM: ErwyAuwVideoViewModel
    @EnvironmentObject var rpuqxNavi: UxzuaNaaviManer
    
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
                IEyabZHskTopBar(iealkaTitle: "Video Sharing") {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 69, height: 42)
                        .overlay{
                            Image(systemName: "plus")
                                .font(.system(size: 22))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }.onTapGesture {
                            rpuqxNavi.push(.czlsiwPostVideo(czlsiwIsVideo: true))
                        }
                }
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
                                ScrollView {
                                    LazyVStack(spacing: 20) {
                                        ForEach(rPuaqunVideoVM.allNotBlockWorks) { videoItem in
                                            PeuqZNhsgaVideoCard( peuqZnhasaVideoItem: videoItem)
                                        }
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
            .background(XiwanEnableSwipeBack())
            .onAppear{
                rPuaqunVideoVM.getAllNotBlockErwyAuwWorks()
            }
    }
}
