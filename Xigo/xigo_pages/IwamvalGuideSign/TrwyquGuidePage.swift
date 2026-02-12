//
//  ContentView.swift
//  Xigo
//
//  Created by yangyang on 2026/2/12.
//

import SwiftUI

struct TrwyquGuidePage: View {
    @AppStorage("ywxmhaiwIsAgree") var tryajkIsAgree: Bool = false
    
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
                        ).padding(.top, 12)
                        .padding(.trailing, 20)
                }
                Spacer()
                VStack(spacing: 30){
                    RadialGradient(colors: [
                        Color(red: 1, green: 128 / 255, blue: 200 / 255),
                        .white
                    ], center: .center,startRadius: 0, endRadius: 30)
                    .frame(width: 242, height: 62)
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
                }.padding(.bottom, 60)
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
                            Text("and")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .underline()
                            Text(" Privacy Policy.")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .underline()
                        }
                    }.foregroundColor(.white)
                    
                }.padding(.bottom, 34)
            }
        }
        
    }
}

#Preview {
    TrwyquGuidePage()
}
