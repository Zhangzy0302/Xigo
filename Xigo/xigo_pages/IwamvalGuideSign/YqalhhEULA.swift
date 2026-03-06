//
//  YqalhhEULA.swift
//  Xigo
//
//  Created by yangyang on 2026/2/25.
//

import SwiftUI

struct YqalhhEULA: View {
    @Binding var yqalhhIsShow: Bool
    @EnvironmentObject var yaqualNavi: UxzuaNaaviManer
    
    var body: some View {
        VStack(spacing: 0) {
            Text("EULA")
                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .extraBold))
            Text("Welcome to Xigo! To make a better place, the following content is not allowed inthe app in particular\n1.Any content about child harm, pornography related detrimental to children.\n2. Fake and harmful messages about recent or current events.\n3. Any violence,bullying content, publicly promotes pornography and other content.\n\nIf we find any content including and not limited to the above violations your content will be deleted and account will bebanned. By clicking the above button,youagreeto the Terms of Use and Privacy Policy")
                .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                .padding(.top, 16)
                .padding(.bottom, 30)
            HStack(spacing: 20){
                VStack(spacing: 20){
                    Text("Terms of Use")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .black))
                        .foregroundColor(XigexcTheme.XigoColor.xiabalMainPurple)
                        .onTapGesture {
                            yaqualNavi.push(UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: "https://app.v88yoi1f.link/users"))
                        }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 116, height: 39)
                        .overlay{
                            Text("Cancel")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .black))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            yqalhhIsShow = false
                        }
                    
                }
                VStack(spacing: 20){
                    Text("Privacy Policy")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .black))
                        .foregroundColor(XigexcTheme.XigoColor.xiabalMainPurple)
                        .onTapGesture {
                            yaqualNavi.push(UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: "https://app.v88yoi1f.link/privacy"))
                        }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(XigexcTheme.XigoColor.xiabalMainPink)
                        .frame(width: 116, height: 39)
                        .overlay{
                            Text("I agree")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .black))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            YwxmhaiwAppState.ywxmhaiwIsAgree = true
                            YwxmhaiwAppState.ywxmhaiwIsEULAAgree = true
                            yqalhhIsShow = false
                        }
                    
                }
            }
        }.padding(20).background(RoundedRectangle(cornerRadius: 20).fill(.white)
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 181 / 255, green: 181 / 255, blue: 181 / 255), lineWidth: 1)
            })
            .padding(.horizontal, 20)
    }
}
