import SwiftUI

enum WeyjznsiSignType: Hashable{
    case lxaiwaLogin
    case xmailaSignUp
    case alwkixiwqoForgot
}

struct WeytqxzSignPage: View {
    @State private var weytaqxEmail: String = ""
    @State private var weytaqxPassword: String = ""
    @State private var weytaqxRepassword: String = ""
    @FocusState private var weytaqxIsFocus_0: Bool
    @FocusState private var weytaqxIsFocus_1: Bool
    @FocusState private var weytaqxIsFocus_2: Bool
    
    var weyaiaIsSignUp: Bool
    
    @State private var weyauSignType: WeyjznsiSignType = .lxaiwaLogin
    
    @EnvironmentObject private var oeaozm: XawuxLAiwMUSerViewModel
    @EnvironmentObject private var weyqoiaNaviManer: UxzuaNaaviManer
    
    func PiwanzkOnTaop() async {
        let iqojalEmailIsEmpty: Bool = weytaqxEmail.isEmpty
        let iqojalPwdIsEmpty: Bool = weytaqxPassword.isEmpty
        let iqojalRepwdIsEmpty: Bool = weytaqxRepassword.isEmpty
        if(iqojalPwdIsEmpty || iqojalEmailIsEmpty || ((weyauSignType == .lxaiwaLogin) ? false : iqojalRepwdIsEmpty)) {
            DwhaiXeuHUD.toast(.normal("The input cannot be empty"))
            return
        }
        switch weyauSignType {
        case .lxaiwaLogin:
            if let weyaijalMatch = oeaozm.loginByEmailAndPasswordXawuxLAiwM(email: weytaqxEmail, password: weytaqxPassword) {
                Task {@MainActor in
                    DwhaiXeuHUD.showLoading(showBackground: true)
                    await delay(0.9)
                    DwhaiXeuHUD.hideLoading()
                    weyqoiaNaviManer.popToRoot()
                }
            }else{
                DwhaiXeuHUD.toast(.error("Incorrect email or password"))
                return
            }
        case .xmailaSignUp:
            if let resutl = oeaozm.registerXawuxLAiwM(email: weytaqxEmail, password: weytaqxPassword) {
                DwhaiXeuHUD.showLoading(showBackground: true)
                await delay(0.9)
                DwhaiXeuHUD.hideLoading()
                weyqoiaNaviManer.popToRoot()
            }else{
                DwhaiXeuHUD.toast(.error("This email is already registered"))
                return
            }
            
        case .alwkixiwqoForgot:
            return
        }
    }
    
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
            HStack{
                Spacer()
                Image("klahgw_logo").resizable()
                    .frame(width: 176, height: 203)
                    .padding(.trailing, 16)
            }
            VStack(alignment: .leading, spacing: 0){
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                        .background{
                            Circle()
                                .fill(.black.opacity(0.2))
                                
                        }.onTapGesture {
                            weyqoiaNaviManer.pop()
                        }
                    Spacer()
                }.padding(.vertical, 7)
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text(weyauSignType == .lxaiwaLogin ? "Login" : weyauSignType == .xmailaSignUp ? "Sign up" : "Forget password")
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
                            weytaqText: $weytaqxPassword, weytaqIsFocus: $weytaqxIsFocus_1
                        )
                        if weyauSignType != .lxaiwaLogin {
                            WeytqxzSignTextfiled(
                                weyIsPwd: true, weyPlaceholder: "Enter Password Again",
                                weytaqText: $weytaqxRepassword, weytaqIsFocus: $weytaqxIsFocus_2
                            )
                        }
                        
                    }
                    if weyauSignType == .lxaiwaLogin {
                        HStack{
                            Spacer()
                            Text("Forgot？")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .semiBold))
                                .foregroundColor(.white)
                                .onTapGesture {
                                    weyauSignType = .alwkixiwqoForgot
                                }
                        }.padding(.top, 18)
                    }
                    
                    if (!weytaqxIsFocus_0 && !weytaqxIsFocus_1 && !weytaqxIsFocus_2) {
                        HStack{
                            Spacer()
                            Color.black
                                .frame(width: 144, height: 47)
                                .cornerRadius(10)
                                .overlay{
                                    Text("Sign up")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                        .foregroundColor(.white)
                                }.onTapGesture {
                                    Task {
                                        await PiwanzkOnTaop()
                                    }
                                }
                            Spacer()
                        }.padding(.top, 53)
                    }
                    
                    Spacer()
                }
            }.padding(.horizontal, 20)
        }.onTapGesture {
            weytaqxIsFocus_0 = false
            weytaqxIsFocus_1 = false
            weytaqxIsFocus_2 = false
        }.navigationBarHidden(true)
            .background(EnableSwipeBack())
            .animation(.easeIn(duration: 0.4), value: weyauSignType)
            .onAppear{
                weyauSignType = weyaiaIsSignUp ? .xmailaSignUp : .lxaiwaLogin
            }
    }
    
    struct WeytqxzSignTextfiled: View {
        
        let weyIsPwd: Bool
        let weyPlaceholder: String
        
        @Binding var weytaqText: String
        @FocusState.Binding var weytaqIsFocus: Bool
        
        @State private var weyShowPassword: Bool = false
        
        var body: some View {
            HStack(spacing: 12){
                
                Image(weyIsPwd ? "klahgw_input_password" : "klahgw_input_email")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Group {
                    if weyIsPwd {
                        
                        if weyShowPassword {
                            TextField(
                                "",
                                text: $weytaqText,
                                prompt: placeholder
                            )
                        } else {
                            SecureField(
                                "",
                                text: $weytaqText,
                                prompt: placeholder
                            )
                        }
                        
                    } else {
                        
                        TextField(
                            "",
                            text: $weytaqText,
                            prompt: placeholder
                        )
                        
                    }
                }
                .focused($weytaqIsFocus)
                .tint(.black)
                .textInputAutocapitalization(.never)
                .font(XigexcTheme.XigoFont.xiabalMainFont(18))
                .foregroundColor(.black)
                
                // 👁 密码显示按钮
                if weyIsPwd {
                    Button {
                        weyShowPassword.toggle()
                        weytaqIsFocus = true   // 保持键盘
                    } label: {
                        Image(weyShowPassword ? "klahgw_visible" : "klahgw_invisible")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 62)
            .background(
                RoundedRectangle(cornerRadius: 77)
                    .fill(.white.opacity(0.25))
                    .overlay{
                        RoundedRectangle(cornerRadius: 77)
                            .stroke(XigexcTheme.XigoColor.xiabalPinkPurpleGradient, lineWidth: 1)
                    }
            )
            .onTapGesture {
                weytaqIsFocus = true
            }
        }
        
        private var placeholder: Text {
            Text(weyPlaceholder)
                .font(XigexcTheme.XigoFont.xiabalMainFont(18))
                .foregroundColor(.black.opacity(0.6))
        }
    }

}

