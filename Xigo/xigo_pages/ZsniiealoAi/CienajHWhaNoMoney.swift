import SwiftUI

struct CienajHWhaNoMoney: View {
    @Binding var cianIsShow: Bool
    @EnvironmentObject var cianeHwNAvi: UxzuaNaaviManer
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 0){
                Text("I'm sorry, your balance is insufficient.")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .semiBold))
                    .foregroundColor(.black)
                    .padding(.top, 62)
                    .padding(.bottom, 17)
                VStack(spacing: 15){
                    Color.black.cornerRadius(10)
                        .frame(width: 129, height: 37)
                        .overlay{
                            Text("Cancel")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            cianIsShow = false
                        }
                    XigexcTheme.XigoColor.xiabalMainPurple.cornerRadius(10)
                        .frame(width: 129, height: 37)
                        .overlay{
                            Text("Recharge")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            cianIsShow = false
                            cianeHwNAvi.push(.kahxuwaofWallet)
                        }
                }
            }.frame(width: 214, height: 233)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [
                            Color(red: 250 / 255, green: 155 / 255, blue: 209 / 255),
                            Color.white,
                            Color(red: 116/255, green: 219/255, blue: 247/255)
                        ], startPoint: .top, endPoint: .bottom))
                        .overlay{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                        }
                )
                .padding(.top, 40)
            Image("klahgw_no_money")
                .resizable()
                .frame(width: 92, height: 106)
        }
    }
}
