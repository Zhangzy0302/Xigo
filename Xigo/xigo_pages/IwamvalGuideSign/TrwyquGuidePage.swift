//
//  ContentView.swift
//  Xigo
//
//  Created by yangyang on 2026/2/12.
//

import SwiftUI

struct TrwyquGuidePage: View {
    @AppStorage("ywxmhaiwIsAgree") var tryajkIsAgree: Bool = false
    @EnvironmentObject var tywiazmNavi: UxzuaNaaviManer
    @EnvironmentObject var tywaizUserVM: XawuxLAiwMUSerViewModel
    
    @State private var trwyquIsShowEula: Bool = false
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("klahgw_guide_pabg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            LinearGradient(colors: [
                Color(red: 1, green: 68 / 255, blue: 182 / 255),
                .white.opacity(0)
            ], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
            
            VStack{
                HStack(alignment: .top){
                    Image("klahgw_logo").resizable()
                        .frame(width: 176, height: 203)
                        .padding(.leading, 8)
                    Spacer()
                    Text("EULA")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .regular))
                        .foregroundColor(.black)
                        .frame(width: 81, height: 34)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                        ).onTapGesture {
                            trwyquIsShowEula = true
                        }.padding(.top, 12)
                        .padding(.trailing, 20)
                }
                Spacer()
                VStack(spacing: 30){
                    RadialGradient(colors: [
                        Color(red: 1, green: 128 / 255, blue: 200 / 255),
                        .white
                    ], center: .center,startRadius: 0, endRadius: 30)
                    .frame(width: 242, height: 62)
                    .onTapGesture {
                        if !YwxmhaiwAppState.ywxmhaiwIsEULAAgree {
                            trwyquIsShowEula = true
                            return
                        }
                        if !YwxmhaiwAppState.ywxmhaiwIsAgree {
                            DwhaiXeuHUD.toast(.normal("Please read and agree to the agreement first"))
                            return
                        }
                        
                        tywiazmNavi.push(UxzuaAppRoute.weytqxzSignPage(weaiuIsSignUp: false))
                        
                    }
                    .scaleEffect(x: 4.0, y: 1.0, anchor: .center)
                        .cornerRadius(33)
                        .shadow(color: .black, radius: 0, x: 0, y: 3 )
                        .overlay{
                            HStack{
                                Image("klahgw_sign_email")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("Sign in with Email")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                            }.padding(.horizontal, 29)
                        }
                    RadialGradient(colors: [
                        Color(red: 1, green: 128 / 255, blue: 200 / 255),
                        .white
                    ], center: .center,startRadius: 0, endRadius: 30)
                    .frame(width: 242, height: 62)
                    .onTapGesture {
                        if !YwxmhaiwAppState.ywxmhaiwIsEULAAgree {
                            trwyquIsShowEula = true
                            return
                        }
                        if !YwxmhaiwAppState.ywxmhaiwIsAgree {
                            DwhaiXeuHUD.toast(.normal("Please read and agree to the agreement first"))
                            return
                        }
                        Task{@MainActor in
                            DwhaiXeuHUD.showLoading(showBackground: true)
                            await xiwandelay(0.6)
                            DwhaiXeuHUD.hideLoading()
                            tywaizUserVM.visitorLoginXawuxLAiwM()
                        }
                        
                        
                    }
                    .scaleEffect(x: 4.0, y: 1.0, anchor: .center)
                        .cornerRadius(33)
                        .shadow(color: .black, radius: 0, x: 0, y: 3 )
                        .overlay{
                            HStack{
                                Image("klahgw_new_user")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("I'm new")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                            }.padding(.horizontal, 29)
                        }
                }
                HStack(spacing: 0){
                    Text("Don't have an account? ")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                        .foregroundColor(.white)
                    Text("Sign up")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                        .foregroundColor(.white)
                        .onTapGesture {
                            if !YwxmhaiwAppState.ywxmhaiwIsEULAAgree {
                                trwyquIsShowEula = true
                                return
                            }
                            if !YwxmhaiwAppState.ywxmhaiwIsAgree {
                                DwhaiXeuHUD.toast(.normal("Please read and agree to the agreement first"))
                                return
                            }
                            
                            tywiazmNavi.push(UxzuaAppRoute.weytqxzSignPage(weaiuIsSignUp: true))
                            
                        }
                }.padding(.bottom, 60)
                    .padding(.top, 16)
                HStack(alignment: .top){
                    Button(action: {
                      withAnimation(.easeInOut) {
                          tryajkIsAgree = !tryajkIsAgree
                      }
                    }) {
                      Image(systemName: tryajkIsAgree ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading, spacing: 0){
                        Text("By continuing , you agree to our ")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                        HStack(spacing: 0) {
                            Text("Terms of Service ")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .underline()
                                .onTapGesture {
                                    tywiazmNavi.push(UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: "https://app.v88yoi1f.link/users"))
                                }
                            Text("and")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .underline()
                            Text(" Privacy Policy.")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .underline()
                                .onTapGesture {
                                    tywiazmNavi.push(UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: "https://app.v88yoi1f.link/privacy"))
                                }
                        }
                    }.foregroundColor(.white)
                    
                }.padding(.bottom, 34)
            }
            
            XigOUWnalAHlkskDialog(xigousIsShow: $trwyquIsShowEula) {
                YqalhhEULA(yqalhhIsShow: $trwyquIsShowEula)
            }
        }.navigationBarHidden(true)
        
    }
}
