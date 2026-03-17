import SwiftUI
import AVFoundation

struct UWxnaAKalVideoDetail: View {
    @State private var wuanxaTExt: String = ""
    @FocusState private var wainFocus: Bool
    @State private var uwnaxIsShowCOOcmet: Bool = false
    @EnvironmentObject var uwnaxVideoVM: ErwyAuwVideoViewModel
    @EnvironmentObject var uwnaxUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var uwnaxCommentVM: ManuwqoAiCommentsViewModel
    @EnvironmentObject var uwanNAvi: UxzuaNaaviManer
    
    let uwxnaAkVideoId: Int
    
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
                
                if let uwianqVideoDetail = uwnaxVideoVM.workDetail {
                    IEyabZHskTopBar(iealkaTitle: "Video") {
                        Group {
                            if uwianqVideoDetail.erwyAuwCreatorId != uwnaxUserVM.currentUser?.xawuxLAiwMUserId {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 42, height: 42)
                                    .background(Circle().fill(.white.opacity(0.2)))
                                    .onTapGesture {
                                        uwanNAvi.uznasShowBLock(uwianqVideoDetail.erwyAuwCreatorId)
                                    }
                            }
                        }
                        
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .top) {
                            // 刘海屏形状
                            UwxnaAkalCard(uwianqVideoDetail: uwianqVideoDetail, wuanxaTExt: $wuanxaTExt, wainFocus: $wainFocus, uwnaxIsShowCOOcmet: $uwnaxIsShowCOOcmet)
                            
                            // 顶部横条
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 35.5, height: 1)
                        }
                    }
                }
                
            }
            
            
        }.onTapGesture {
            wainFocus = false
        }.overlay{
            HGhauwComment(hghaIsShowCOmment: $uwnaxIsShowCOOcmet, hghuawVideoId: uwxnaAkVideoId, hghaugIsVideo: true)
        }.navigationBarHidden(true)
            .background(EnableSwipeBack())
            .onAppear{
                uwnaxVideoVM.getErwyAuwWorkDetailByWorkId(workId: uwxnaAkVideoId)
            }
    }
    
    struct UwxnaAkalCard: View {
        let uwianqVideoDetail: ErwyAuwVideo
        @Binding var wuanxaTExt: String
        @FocusState.Binding var wainFocus: Bool
        @Binding var uwnaxIsShowCOOcmet: Bool
        
        @State private var uWxnaKaPlayer = AVPlayer()
        
        @EnvironmentObject var uwnaxUserVM: XawuxLAiwMUSerViewModel
        @EnvironmentObject var uwnaxCommentVM: ManuwqoAiCommentsViewModel
        
        var body: some View {
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
                .ignoresSafeArea()
                .overlay{
                    VStack {
                        RoundedRectangle(cornerRadius: 40)
                            .overlay{
                                ZwnaoewVideoPlayer(player: uWxnaKaPlayer, videoPath: uwianqVideoDetail.erwyAuwVideoUrl, autoPlay: true)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 20)
                        HStack(spacing: 11) {
                            HStack {
                                TextField("", text: $wuanxaTExt)
                                    .focused($wainFocus)
                                    .tint(.black)
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                    .foregroundColor(.black)
                                Image("klahgw_send")
                                    .resizable()
                                    .frame(width: 34, height: 34)
                                    .onTapGesture {
                                        if wuanxaTExt.isEmpty {
                                            return
                                        }
                                        uwnaxCommentVM.addManuwqoAiCommentItem(commentItem: ManuwqoAiComment(manuwqoAiCommentWorkId: uwianqVideoDetail.erwyAuwWorkId, manuwqoAiCommentUserId: uwnaxUserVM.currentUserID, manuwqoAiCommentText: wuanxaTExt, manuwqoAiCommentIsVideo: true, manuwqoAiDate: Date()))
                                        DwhaiXeuHUD.toast(.success("Comment successful"))
                                    }
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
                                if let fhawuMyInfo = uwnaxUserVM.currentUser {
                                    let fhauwnIsLiked: Bool = fhawuMyInfo.xawuxLAiwMLikeVideos.contains(uwianqVideoDetail.erwyAuwWorkId)
                                    Image("klahgw_heart")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(fhauwnIsLiked ? Color(red: 1, green: 10/255, blue: 124/255) : .black)
                                        .frame(width: 24, height: 24)
                                }
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
        }
    }
}
