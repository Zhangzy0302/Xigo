import SwiftUI

struct HGhauwComment: View {
    @Binding var hghaIsShowCOmment: Bool
    
    @EnvironmentObject var hghauwCommentVM: ManuwqoAiCommentsViewModel
    @EnvironmentObject var hgajajUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var hgaiNavi: UxzuaNaaviManer
    let hghuawVideoId: Int
    let hghaugIsVideo: Bool
    
    func formatVideoDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.M.d  HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            if hghaIsShowCOmment {
                Color.white.opacity(0.01).ignoresSafeArea()
                    .onTapGesture {
                        hghaIsShowCOmment = false
                    }
                VStack{
                    HStack{
                        Text("Comment")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                            .foregroundColor(.white)
                            .italic(true)
                        Spacer()
                    }.padding(.bottom, 18)
                    ScrollView {
                        LazyVStack(spacing: 12){
                            let hgahakCommentsList = hghaugIsVideo ? hghauwCommentVM.videoCommentsNotBlock : hghauwCommentVM.cosPostCommentsNotBlock
                            if hgahakCommentsList.isEmpty {
                                XigexNoawEmptyData(xigoexTopPadding: 17)
                            }else {
                                ForEach(hgahakCommentsList) { comment in
                                    VStack(spacing: 0){
                                        HStack{
                                            if let hghauwUserInfo = hghauwCommentVM.getManuwqoAiCommetUserInfo(userId: comment.manuwqoAiCommentUserId){
                                                SkahwuLwXImage(SkahwuLwXImageUrl: hghauwUserInfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 34, SkahwuLwXHeight: 34, SkahwuLwXIsCircle: true)
                                                    .onTapGesture {
                                                        hgaiNavi.push(.bnzjsjaAkUserPage(bnaijzUserID: hghauwUserInfo.xawuxLAiwMUserId, bnjizIsMine: false))
                                                    }
                                                VStack(alignment: .leading, spacing: 2){
                                                    Text(hghauwUserInfo.xawuxLAiwMUserName)
                                                        .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                                                        .foregroundColor(.white)
                                                    Text(formatVideoDate(comment.manuwqoAiDate))
                                                        .font(XigexcTheme.XigoFont.xiabalMainFont(10))
                                                        .foregroundColor(.white)
                                                }
                                                Spacer()
                                                if comment.manuwqoAiCommentUserId != hgajajUserVM.currentUser!.xawuxLAiwMUserId {
                                                    Image(systemName: "ellipsis")
                                                        .font(.system(size: 16))
                                                        .foregroundColor(.black)
                                                        .frame(width: 32, height: 20)
                                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                                        .onTapGesture {
                                                            hgaiNavi.uznasShowBLock(comment.manuwqoAiCommentUserId)
                                                        }
                                                }
                                                
                                            }
                                            
                                        }.padding(.bottom, 10)
                                        Text(comment.manuwqoAiCommentText)
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 12)
                                        Rectangle()
                                            .fill(.white.opacity(0.5))
                                            .frame(height: 1)
                                        
                                    }
                                }
                            }
                            
                            
                        }.padding(.bottom, 34)
                    }
                }.padding(.horizontal, 20)
                    .padding(.top, 12)
                    .frame(height: 400)
                    .background(
                        UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20)
                            .fill(.black)
                            .overlay{
                                ZStack(alignment: .topTrailing){
                                    Image("klahgw_comment_list")
                                        .resizable()
                                        .frame(width: 38, height: 28)
                                        .padding(.trailing, 36)
                                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            }
                    )
            }
           
        }.ignoresSafeArea()
            .transition(.slide)
            .animation(.easeOut, value: hghaIsShowCOmment)
            .onAppear{
                if hghaugIsVideo {
                    hghauwCommentVM.getVideoManuwqoAiCommentsNotBlockByWorkId(workId: hghuawVideoId)
                }else {
                    hghauwCommentVM.getCosPostManuwqoAiCommentsNotBlockByWorkId(workId: hghuawVideoId)
                }
                
                
            }
        
    }
}
