import SwiftUI

struct NCbzSalDeleteAccont: View {
    @Binding var ncbnaSaIsShow: Bool
    
    @EnvironmentObject var ncvhahUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var ncajaxmVIdeoVM: ErwyAuwVideoViewModel
    @EnvironmentObject var ncauzPostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var nabsjAMChatVM: SswzuLwoqxChatViewModel
    @EnvironmentObject var nacbaMaCOmmentVM: ManuwqoAiCommentsViewModel
    
    @EnvironmentObject var nvcajNavi: UxzuaNaaviManer
    
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(colors: [
                    Color(red: 250/255, green: 155/255, blue: 209/255),
                    .white,
                    Color(red: 116/255, green: 219/255, blue: 247/255)
                ], startPoint: .top, endPoint: .bottom))
                .frame(width: 214, height: 283)
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 2)
                }.overlay{
                    VStack(spacing: 24){
                        Text("Deleting the account will clear the data. Are you sure you want to continue?")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        VStack(spacing: 15){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                                .frame(width: 129, height: 37)
                                .overlay{
                                    Text("Sure")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                        .foregroundColor(.white)
                                }.onTapGesture {
                                    let ncvSaiwUserID = ncvhahUserVM.currentUserID
                                    Task{
                                        DwhaiXeuHUD.showLoading(showBackground: true)
                                        await xiwandelay(2)
                                        DwhaiXeuHUD.hideLoading()
                                        ncauzPostVM.softDeletePostsByUserId(ncvSaiwUserID)
                                        ncajaxmVIdeoVM.deleteMyErwyAuwWorks()
                                        nacbaMaCOmmentVM.deleteManuwqoAiCommentItem()
                                        nabsjAMChatVM.markAllMyChatRoomsAsDeleted()
                                        ncvhahUserVM.deleteAccountXawuxLAiwM()
                                        
                                        nvcajNavi.popToRoot()
                                    }
                                    
                                    
                                }
                            RoundedRectangle(cornerRadius: 10)
                                .fill(XigexcTheme.XigoColor.xiabalMainPurple)
                                .frame(width: 129, height: 37)
                                .overlay{
                                    Text("No")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                        .foregroundColor(.white)
                                }.onTapGesture {
                                    ncbnaSaIsShow = false
                                }
                        }
                    }.padding(.horizontal, 18)
                        .padding(.top, 62)
                }.padding(.top, 40)
            Image("klahgw_delete_account")
                .resizable()
                .frame(width: 92, height: 106)
            
        }
    }
}
