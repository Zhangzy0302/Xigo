import SwiftUI

struct JayuwalReportBlock: View {
    @Binding var jayuwalIsShowBlock: Bool
    @EnvironmentObject var jaywuahNavi: UxzuaNaaviManer
    @EnvironmentObject var jaywUserVm: XawuxLAiwMUSerViewModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.opacity(0.5).ignoresSafeArea()
                .onTapGesture {
                    jayuwalIsShowBlock = false
                }
            VStack(spacing: 10){
                Text("Report")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                    .foregroundColor(.white)
                    .frame(width: 180, height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 97/255, green: 97/255, blue: 97/255))
                    ).onTapGesture {
                        jayuwalIsShowBlock = false
                        jaywuahNavi.push(.iwynazReportPage)
                    }
                Text("Shield")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                    .foregroundColor(.white)
                    .frame(width: 180, height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 97/255, green: 97/255, blue: 97/255))
                    ).onTapGesture {
                        jaywUserVm.toggleUserIsBlocked(blockUserId: jaywuahNavi.uzlajBLockUserID!)
                        jayuwalIsShowBlock = false
                        DwhaiXeuHUD.toast(.success("Blocked successfully"))
                        jaywuahNavi.popToRoot()
                    }
                Text("Cancel")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                    .foregroundColor(.white)
                    .frame(width: 180, height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 97/255, green: 97/255, blue: 97/255))
                    ).onTapGesture {
                        jayuwalIsShowBlock = false
                    }
            }.padding(.vertical, 30)
                .padding(.horizontal, 33)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                ).shadow(color: XigexcTheme.XigoColor.xiabalMainPink, radius: 4, x: 0, y: 2)
                .padding(.bottom, 88)
        }
    }
}
