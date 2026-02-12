import SwiftUI

struct WeytqxzSignPage: View {
    @State private var weytaqxEmail: String = ""
    @State private var weytaqxPassword: String = ""
    @State private var weytaqxRepassword: String = ""
    @FocusState private var weytaqxIsFocus_0: Bool
    @FocusState private var weytaqxIsFocus_1: Bool
    @FocusState private var weytaqxIsFocus_2: Bool
    
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geo in
                Image("klahgw_sign_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            Image("klahgw_logo").resizable()
                .frame(width: 176, height: 203)
                .padding(.trailing, 16)
            VStack(alignment: .leading, spacing: 0){
                Spacer()
                Text("Login")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(36, weight: .semiBold))
                    .foregroundColor(XigexcTheme.XigoColor.xiabalMainPink)
                    .padding(.leading, 25)
                    .padding(.bottom, 27)
                VStack(spacing: 24) {
                    WeytqxzSignTextfiled(
                        weyIsPwd: false, weyPlaceholder: "Enter Your E-mail",
                        weytaqText: $weytaqxEmail, weytaqIsFocus: $weytaqxIsFocus_0
                    )
                    WeytqxzSignTextfiled(
                        weyIsPwd: true, weyPlaceholder: "Enter Password",
                        weytaqText: $weytaqxEmail, weytaqIsFocus: $weytaqxIsFocus_0
                    )
                    WeytqxzSignTextfiled(
                        weyIsPwd: true, weyPlaceholder: "Enter Password Again",
                        weytaqText: $weytaqxEmail, weytaqIsFocus: $weytaqxIsFocus_0
                    )
                }
                HStack{
                    Spacer()
                    Text("Forgot？")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .semiBold))
                        .foregroundColor(.white)
                }.padding(.top, 18)
                HStack{
                    Spacer()
                    Color.black
                        .frame(width: 144, height: 47)
                        .cornerRadius(10)
                        .overlay{
                            Text("Sign up")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                .foregroundColor(.white)
                        }
                    Spacer()
                }.padding(.top, 53)
                Spacer()
            }.padding(.horizontal, 20)
        }.navigationBarHidden(false)
    }
    
    struct WeytqxzSignTextfiled: View {
        let weyIsPwd: Bool
        let weyPlaceholder: String
        @Binding var weytaqText: String
        @FocusState.Binding var weytaqIsFocus: Bool
        
        var body: some View {
            HStack(spacing: 12){
                Image(weyIsPwd ? "klahgw_input_password" : "klahgw_input_email")
                    .resizable()
                    .frame(width: 24, height: 24)
                TextField(weyPlaceholder, text: $weytaqText)
                    .focused($weytaqIsFocus)
            }.padding(.horizontal, 20).frame(height: 62)
                .background(
                    RoundedRectangle(cornerRadius: 77)
                        .fill(.white.opacity(0.25))
                        .overlay{
                            RoundedRectangle(cornerRadius: 77)
                                .stroke(XigexcTheme.XigoColor.xiabalPinkPurpleGradient, lineWidth: 1)
                        }
                )
        }
    }

}

#Preview {
    WeytqxzSignPage()
}
