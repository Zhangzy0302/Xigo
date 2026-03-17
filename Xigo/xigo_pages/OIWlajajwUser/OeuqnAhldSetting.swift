import SwiftUI

struct OeuqnAhldSetting: View {
    @EnvironmentObject var owianzNaviManer: UxzuaNaaviManer
    @State private var oezShowDelete: Bool = false
    
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
            VStack{
                IEyabZHskTopBar(iealkaTitle: "Setting")
                VStack(spacing: 20){
                    ForEach(0...4, id: \.self) { index in
                        OeuxanSettingItem(oezuShowDelete: $oezShowDelete, oeuanxSettingIndex: index)
                    }.padding(.horizontal, 20)
                        
                }.padding(.top, 20)
            }
            
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
            .overlay{
            XigOUWnalAHlkskDialog(
                xigousIsShow: $oezShowDelete
            ) {
                NCbzSalDeleteAccont(ncbnaSaIsShow: $oezShowDelete)
            }
        }
    }
    
    struct OeuxanSettingItem: View {
        @EnvironmentObject var xoanzlmManar: UxzuaNaaviManer
        @EnvironmentObject var oeuqnaUserVM: XawuxLAiwMUSerViewModel
        @Binding var oezuShowDelete: Bool
        let oeuqunxcnaSettingIcons = [
            "klahgw_set_user_agreement",
            "klahgw_set_privacy",
            "klahgw_set_blacklist",
            "klahgw_set_delete",
            "klahgw_set_log_out"
        ]
        
        let oweqxnaSettingName: [String] = [
            "User Agreement",
            "Privacy Agreement  ",
            "Blacklist",
            "Deleting an account",
            "Log out"
        ]
        func oeainxzlOnTap(xoanIndex: Int) {
            switch xoanIndex {
            case 0:
                xoanzlmManar.push(UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: "https://app.v88yoi1f.link/users"))
            case 1:
                xoanzlmManar.push(UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: "https://app.v88yoi1f.link/privacy"))
            case 2:
                xoanzlmManar.push(UxzuaAppRoute.wxznWyUserList(wxsaujListType: .xiwaBlacklsit))
            case 3:
                oezuShowDelete = true
            case 4:
                oeuqnaUserVM.logoutXawuxLAiwM()
                xoanzlmManar.popToRoot()
            default:
                return
            }
        }
        
        let oeuanxSettingIndex: Int
        var body: some View {
            HStack{
                Image(oeuqunxcnaSettingIcons[oeuanxSettingIndex])
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(oweqxnaSettingName[oeuanxSettingIndex])
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }.padding(.horizontal, 14)
                .frame(height: 52)
                .background(RoundedRectangle(cornerRadius: 40).fill(.white))
                .onTapGesture {
                    oeainxzlOnTap(xoanIndex: oeuanxSettingIndex)
                }
        }
    }
}
