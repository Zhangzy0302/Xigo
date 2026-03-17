import SwiftUI

struct FhweyaOueCosDetail: View {
    @State private var wuanxaTExt: String = ""
    @FocusState private var wainFocus: Bool
    
    @EnvironmentObject var fhwyaOnePostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var uwnaxUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var uwnaxCommentVM: ManuwqoAiCommentsViewModel
    @EnvironmentObject var fhwayNavi: UxzuaNaaviManer
    
    @State private var fhweyaIsShowComment: Bool = false
    
    let fhweyaOuePostId: Int
    
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
                if let fhweyOuePostDetail = fhwyaOnePostVM.getUiqbahCosPostsByPostID(fhweyaOuePostId) {
                    IEyabZHskTopBar() {
                        Group {
                            if fhweyOuePostDetail.wUiqbahCosPostsUserId != uwnaxUserVM.currentUser!.xawuxLAiwMUserId {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 42, height: 42)
                                    .background(Circle().fill(.white.opacity(0.2)))
                                    .onTapGesture {
                                        fhwayNavi.uznasShowBLock(fhweyOuePostDetail.wUiqbahCosPostsUserId)
                                    }
                            }
                        }
                        
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .top) {
                            // 刘海屏形状
                            FhuwyaContent(wuanxaTExt: $wuanxaTExt, wainFocus: $wainFocus, fhweyOuePostDetail: fhweyOuePostDetail, fhweyaOuePostId: fhweyaOuePostId, fhweyaIsShowComment: $fhweyaIsShowComment)
                            
                            // 顶部横条
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 35.5, height: 1)
                                .shadow(color: .black.opacity(0.25), radius: 4)
                        }
                    }
                }
                
            }
            HGhauwComment(hghaIsShowCOmment: $fhweyaIsShowComment, hghuawVideoId: fhweyaOuePostId, hghaugIsVideo: false)
            
        }.onTapGesture {
            wainFocus = false
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
    }
    
    
}

struct FhuwyaContent: View {
    @Binding var wuanxaTExt: String
    @FocusState.Binding var wainFocus: Bool
    
    let fhweyOuePostDetail: WUiqbahCosPosts
    let fhweyaOuePostId: Int
    @Binding var fhweyaIsShowComment: Bool
    @EnvironmentObject var fhwyaOnePostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var uwnaxUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var uwnaxCommentVM: ManuwqoAiCommentsViewModel
    @EnvironmentObject var fhwayNavi: UxzuaNaaviManer
    
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
            .ignoresSafeArea(edges: .bottom)
            .overlay{
                VStack(spacing: 0) {
                    TabView {
                        let images = fhweyOuePostDetail.wUiqbahCosPostsImageList

                        ForEach(images.indices, id: \.self) { index in
                            SkahwuLwXImage(
                                SkahwuLwXImageUrl: images[index]
                            ).frame(maxWidth: .infinity)
                            .cornerRadius(40)
                        }
                    }.frame(maxHeight: .infinity)
                        .tabViewStyle(.page(indexDisplayMode: .always)) // 【关键】启用横向滑动分页
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
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
                                    uwnaxCommentVM.addManuwqoAiCommentItem(commentItem: ManuwqoAiComment(manuwqoAiCommentWorkId: fhweyOuePostDetail.wUiqbahCosPostsId, manuwqoAiCommentUserId: uwnaxUserVM.currentUserID, manuwqoAiCommentText: wuanxaTExt, manuwqoAiCommentIsVideo: true, manuwqoAiDate: Date()))
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
                                let fhauwnIsLiked: Bool = fhawuMyInfo.xawuxLAiwMLikePosts.contains(fhweyaOuePostId)
                                Image("klahgw_heart")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(fhauwnIsLiked ? Color(red: 1, green: 10/255, blue: 124/255) : .white)
                                    .frame(width: 24, height: 24)
                                    .onTapGesture {
                                        uwnaxUserVM.toggleCosPostsIsLiked(fhweyaOuePostId)
                                    }
                            }
                            
                            Image("klahgw_comment")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .onTapGesture{
                                    fhweyaIsShowComment = true
                                }
                            
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
