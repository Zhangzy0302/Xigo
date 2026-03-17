import SwiftUI

struct PeuqZNhsgaVideoCard: View {
    @EnvironmentObject var peaunNavi: UxzuaNaaviManer
    @EnvironmentObject var peaunaVideoVM: ErwyAuwVideoViewModel
    @EnvironmentObject var peuanUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var peauanCommentVm: ManuwqoAiCommentsViewModel
    
    let peuqZnhasaVideoItem: ErwyAuwVideo
    
    func formatVideoDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.M.d  HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            if let peuanUserInfo = peuanUserVM.returnXawuxLAiwMUserInfoById(userId: peuqZnhasaVideoItem.erwyAuwCreatorId) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        SkahwuLwXImage(SkahwuLwXImageUrl: peuanUserInfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 34, SkahwuLwXHeight: 34, SkahwuLwXIsCircle: true).onTapGesture {
                            peaunNavi.push(.bnzjsjaAkUserPage(bnaijzUserID: peuanUserInfo.xawuxLAiwMUserId, bnjizIsMine: false))
                        }
                        VStack(alignment: .leading) {
                            Text(peuanUserInfo.xawuxLAiwMUserName)
                                .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                                .foregroundColor(.black)
                            // "2024.4.18  14:35:17"
                            Text(formatVideoDate(peuqZnhasaVideoItem.erwyAuwDate))
                                .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                .foregroundColor(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                        }.padding(.leading, 12)
                        Spacer()
                        if peuanUserInfo.xawuxLAiwMUserId != peuanUserVM.currentUserID {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(width: 32, height: 20)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 1, green: 230/255, blue: 244/255)))
                                .onTapGesture {
                                    peaunNavi.uznasShowBLock(peuanUserInfo.xawuxLAiwMUserId)
                                }
                        }
                        
                    }.padding(.bottom, 10)
                    Text(peuqZnhasaVideoItem.erwyAuwTextContent)
                        .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                        .foregroundColor(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                }
                ZStack {
                    SkahwuLwXImage(
                        SkahwuLwXImageUrl: peuqZnhasaVideoItem.erwyAuwVideoCover,
                        SkahwuLwXHeight: 219
                    )
                    .cornerRadius(20)

                    Image("akklahgwwl_play")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .frame(height: 219)
                .clipped()
                .contentShape(Rectangle())
                .onTapGesture {
                    peaunNavi.push(
                        UxzuaAppRoute.uWxnazaAkalVideoDetail(
                            uWanaiVideoID: peuqZnhasaVideoItem.erwyAuwWorkId
                        )
                    )
                }
                Rectangle()
                    .fill(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                    .frame(height: 1)
                HStack {
                    HStack(spacing: 4) {
                        if let fhawuMyInfo = peuanUserVM.currentUser {
                            let fhauwnIsLiked: Bool = fhawuMyInfo.xawuxLAiwMLikeVideos.contains(peuqZnhasaVideoItem.erwyAuwWorkId)
                            Image("klahgw_heart")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(fhauwnIsLiked ? Color(red: 1, green: 10/255, blue: 124/255) : .black)
                                .frame(width: 20, height: 20)
                            Text("\(peuqZnhasaVideoItem.erwyAuwLikeCount)")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                .foregroundColor(.black)
                        }
                        
                    }.onTapGesture {
                        peuanUserVM.toggleVideoIsLiked(peuqZnhasaVideoItem.erwyAuwWorkId)
                        peaunaVideoVM.getAllNotBlockErwyAuwWorks()
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        
                        Image("klahgw_comment")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                         
                        Text("\(peauanCommentVm.getVideoManuwqoAiCommentsNotBlockCountByWorkId(workId: peuqZnhasaVideoItem.erwyAuwWorkId))")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                            .foregroundColor(.black)
                        
                    }.onTapGesture {
                        peaunNavi.push(
                            UxzuaAppRoute.uWxnazaAkalVideoDetail(
                                uWanaiVideoID: peuqZnhasaVideoItem.erwyAuwWorkId
                            )
                        )
                    }
                    
                }.padding(.horizontal, 27)
            }
            
        }.padding(16).background(.white)
            .cornerRadius(20).clipped()
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            .padding(.horizontal, 20)
            .padding(.top, 3)
        
    }
}
