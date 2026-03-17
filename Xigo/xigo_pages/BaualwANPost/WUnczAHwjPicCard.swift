import SwiftUI

struct WUnczAHwjPicCard: View {
    let wunczAHwpicPostDetail: WUiqbahCosPosts
    
    @EnvironmentObject var wuxnaPostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var wuznaUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var wuznaNavi: UxzuaNaaviManer
    
    func wunaxnaFormatDate(_ alkjw: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "MM - dd"
        return alkjw.formatted()
    }
    
    var body: some View {
        VStack(spacing: 12){
            HStack(spacing: 0) {
                if let wialxzUserINfo = wuznaUserVM.returnXawuxLAiwMUserInfoById(userId: wunczAHwpicPostDetail.wUiqbahCosPostsUserId) {
                    SkahwuLwXImage(SkahwuLwXImageUrl: wialxzUserINfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 45, SkahwuLwXHeight: 45, SkahwuLwXIsCircle: true)
                        .onTapGesture {
                            wuznaNavi.push(.bnzjsjaAkUserPage(bnaijzUserID: wialxzUserINfo.xawuxLAiwMUserId, bnjizIsMine: false))
                        }
                    Text(wialxzUserINfo.xawuxLAiwMUserName)
                        .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                        .foregroundColor(.black)
                        .padding(.leading, 13)
                    Spacer()
                    if wunczAHwpicPostDetail.wUiqbahCosPostsUserId != wuznaUserVM.currentUserID {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .frame(width: 32, height: 20)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            .onTapGesture {
                                wuznaNavi.uznasShowBLock(wialxzUserINfo.xawuxLAiwMUserId)
                            }
                    }
                    
                }
                
            }
            VStack(alignment: .leading, spacing: 8){
                let images = wunczAHwpicPostDetail.wUiqbahCosPostsImageList

                HStack(spacing: 12) {
                    ForEach(images.indices.prefix(3), id: \.self) { index in
                        SkahwuLwXImage(
                            SkahwuLwXImageUrl: images[index],
                            SkahwuLwXHeight: 119
                        )
                        .cornerRadius(10)
                    }
                }
                Text(wunczAHwpicPostDetail.wUiqbahCosPostsText)
                    .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                    .foregroundColor(Color(red: 51 / 255, green: 52 / 255, blue: 51 / 255))
            }
            VStack {
                HStack {
                    Text(wunaxnaFormatDate(wunczAHwpicPostDetail.wUiqbahCosPostsDate))
                        .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                        .foregroundColor(.black)
                    Spacer()
                    HStack(spacing: 4) {
                        
                        if let fhawuMyInfo = wuznaUserVM.currentUser {
                            let fhauwnIsLiked: Bool = fhawuMyInfo.xawuxLAiwMLikePosts.contains(wunczAHwpicPostDetail.wUiqbahCosPostsId)
                            Image("klahgw_heart")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(fhauwnIsLiked ? Color(red: 1, green: 10/255, blue: 124/255) : .black)
                                .frame(width: 20, height: 20)
                            Text("\(wunczAHwpicPostDetail.wUiqbahCosPostsLikesCount)")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                .foregroundColor(.black)
                        }
                        
                    }.onTapGesture {
                        wuznaUserVM.toggleCosPostsIsLiked(wunczAHwpicPostDetail.wUiqbahCosPostsId)
                        wuxnaPostVM.getAllNotBlockwUiqbahCosPosts()
                    }
                }
                Rectangle()
                    .fill(Color(red: 102 / 255, green: 102 / 255, blue: 102 / 255))
                    .frame(height: 1)
            }
        }.onTapGesture {
            wuznaNavi.push(.fhweyaOueCosDetail(fhwuPostId: wunczAHwpicPostDetail.wUiqbahCosPostsId))
        }
        .padding(.horizontal, 20)
            
    }
}
