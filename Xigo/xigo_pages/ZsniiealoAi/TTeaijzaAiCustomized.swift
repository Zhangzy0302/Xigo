import SwiftUI

struct TTeaijzaAiCustomized: View {
    let ttiaenlColumns: [GridItem] = [GridItem(.flexible(), spacing: 26), GridItem(.flexible())]
    
    let ttiaeScene: [String] = ["Indoor", "Outdoor"]
    let ttiaeMethod = ["Social contact", "Relax"]
    let ttiaeDiffculty = ["Primary", "Intermediate", "Advanced"]
    
    @State private var ttieaSelectScene: String = ""
    @State private var ttieaSelectMethod: String = ""
    @State private var ttieaSelectDiffculty: String = ""
    
    @State private var ttiealnActivityName: String = ""
    @FocusState private var ttiwalOIsFocus_0: Bool
    
    @State private var ttiealnIntroduce: String = ""
    @FocusState private var ttiwalOIsFocus_1: Bool
    
    @EnvironmentObject var tteajiAiUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var ttiaueNAvi: UxzuaNaaviManer
    
    @State private var ttauIsShowNoMOney: Bool = false

    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            VStack{
                IEyabZHskTopBar(iealkaTitle: "AI Customized ")
                GeometryReader { geo in
                    ZStack{
                        ZStack(alignment: .top) {
                            // 刘海屏形状
                            OAjdsaCneScreenShape(notchDepth: 30)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white,
                                            Color(red: 1.0, green: 0.92, blue: 0.96)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(maxHeight: .infinity)
                                .shadow(radius: 10)
                            
                            // 顶部横条
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 56, height: 2)
                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                        }
                        ScrollViewReader { proxy in
                            ScrollView {
                                VStack(spacing: 0){
                                    VStack(spacing: 24){
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("Select Scene")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                                                .foregroundColor(.black)
                                            LazyVGrid(columns: ttiaenlColumns) {
                                                ForEach(ttiaeScene, id: \.self) { item in
                                                    TTialwmbSeletedButton(tirtText: item, tiealnzSeleted: $ttieaSelectScene)
                                                }
                                            }
                                        }
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("Selection method")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                                                .foregroundColor(.black)
                                            LazyVGrid(columns: ttiaenlColumns) {
                                                ForEach(ttiaeMethod, id: \.self) { item in
                                                    TTialwmbSeletedButton(tirtText: item, tiealnzSeleted: $ttieaSelectMethod)
                                                }
                                            }
                                        }
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("Selection method")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                                                .foregroundColor(.black)
                                            LazyVGrid(columns: ttiaenlColumns, spacing: 10) {
                                                ForEach(ttiaeDiffculty, id: \.self) { item in
                                                    TTialwmbSeletedButton(tirtText: item, tiealnzSeleted: $ttieaSelectDiffculty)
                                                }
                                            }
                                        }
                                    }
                                    VStack(spacing: 0){
                                        Text("Generate a plan")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                                            .foregroundColor(.black)
                                            .padding(.bottom, 20)
                                        HStack{
                                            Text("Activity Name")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                                .foregroundColor(.black)
                                            TTianlTextFiled(ttiajText: $ttiealnActivityName, ttiIsFocus: $ttiwalOIsFocus_0)
                                        }.padding(.horizontal, 14)
                                            .padding(.vertical, 16)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white)
                                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2))
                                            .padding(.bottom, 16)
                                        VStack(alignment: .leading, spacing: 16){
                                            Text("Introduction:")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                                .foregroundColor(.black)
                                            TTianlTextFiled(ttiajText: $ttiealnIntroduce, ttiIsFocus: $ttiwalOIsFocus_1)
                                                
                                        }.padding(.horizontal, 14)
                                            .padding(.vertical, 16)
                                            .frame(height: 163, alignment: .topLeading)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white)
                                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2))
                                    }.padding(.top, 30)
                                        .padding(.bottom, ttiwalOIsFocus_1 ? 100 : 0)
                                        .animation(.easeOut(duration: 0.25), value: ttiwalOIsFocus_1)
                                    HStack(spacing: 0){
                                        Text("Generate")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                                            .foregroundColor(.white)
                                            .padding(.trailing, 11)
                                        Image("klahgw_coin")
                                            .resizable()
                                            .frame(width: 24, height: 27)
                                            .padding(.trailing, 6)
                                        Text("-300")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                                            .foregroundColor(.white)
                                    }.padding(10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.black)
                                        ).onTapGesture {
                                            if ttieaSelectScene.isEmpty || ttieaSelectMethod.isEmpty || ttieaSelectDiffculty.isEmpty {
                                                DwhaiXeuHUD.toast(.error("Please select all options"))
                                                return
                                            }
                                            if ttiealnActivityName.isEmpty || ttiealnIntroduce.isEmpty {
                                                DwhaiXeuHUD.toast(.error("Please enter the event information"))
                                                return
                                            }
                                            if let tteuaMyInfo = tteajiAiUserVM.currentUser {
                                                if tteuaMyInfo.xawuxLAiwMWalletBalance >= 300 {
                                                    tteajiAiUserVM.increaseUserDiamond(diamond: -300)
                                                    ttiaueNAvi.push(.ryEyxnaWaiResutl(scene: ttieaSelectScene, method: ttieaSelectMethod, difficulty: ttieaSelectDiffculty, acName: ttiealnActivityName))
                                                }else{
                                                    withAnimation{
                                                        ttauIsShowNoMOney = true
                                                    }
                                                }
                                            }
                                        }.padding(.vertical, 34)
                                }.padding(.horizontal, 20)
                                    
                            }.padding(.top, 40)
                        }
                    }
                }.ignoresSafeArea()
            }
            XigOUWnalAHlkskDialog(xigousIsShow: $ttauIsShowNoMOney) {
                CienajHWhaNoMoney(cianIsShow: $ttauIsShowNoMOney)
            }.transition(.opacity)
        }.navigationBarHidden(true)
            .background(EnableSwipeBack())
            .onTapGesture {
                ttiwalOIsFocus_0 = false
                ttiwalOIsFocus_1 = false
            }
    }
    
    struct TTialwmbSeletedButton: View {
        let tirtText: String
        @Binding var tiealnzSeleted: String
        
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(tiealnzSeleted != tirtText ? .black : .white)
                .frame(height: 51)
                .overlay{
                    if tiealnzSeleted == tirtText {
                        RoundedRectangle(cornerRadius: 10)
                           .stroke(XigexcTheme.XigoColor.xiabalPinkPurpleGradient, lineWidth: 2)
                    }
                     
                }.overlay{
                    Text(tirtText)
                        .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .regular))
                        .foregroundColor(tiealnzSeleted == tirtText ? .black : .white)
                }.onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        tiealnzSeleted = tirtText
                    }
                }
        }
    }
    
    struct TTianlTextFiled: View {
        @Binding var ttiajText: String
        @FocusState.Binding var ttiIsFocus: Bool
        
        var body: some View {
            TextField("", text: $ttiajText)
                .focused($ttiIsFocus)
                .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                .foregroundColor(.black)
                .tint(.black)
                .autocorrectionDisabled(false)
        }
    }
}
