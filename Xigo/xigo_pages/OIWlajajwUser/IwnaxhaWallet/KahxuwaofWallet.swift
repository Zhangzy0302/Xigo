import SwiftUI

struct KahxuwaofWallet: View {
    @EnvironmentObject var kahsuUserVM: XawuxLAiwMUSerViewModel
    @EnvironmentObject var kahsuWalletIpa: IwhanxaIAPManager
    
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
                IEyabZHskTopBar(iealkaTitle: "My wallet")
                ScrollView{
                    VStack(spacing: 0){
                        Image("klahgw_wallet_card")
                            .resizable()
                            .frame(height: 175)
                            .overlay{
                                VStack{
                                    HStack{
                                        Text("Wallet Balance")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .extraBold))
                                            .italic(true)
                                        Spacer()
                                        HStack(spacing: 10){
                                            Image("klahgw_coin")
                                                .resizable()
                                                .frame(width: 24, height: 27)
                                            if let kahxuwaUserInfo = kahsuUserVM.currentUser {
                                                Text("\(kahxuwaUserInfo.xawuxLAiwMWalletBalance)")
                                                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                                            }
                                            
                                        }
                                    }.padding(.horizontal, 20)
                                        .padding(.top, 16)
                                    Spacer()
                                }
                            }.padding(.bottom, 20)
                        
                        LazyVGrid(columns: [GridItem(.flexible(),spacing: 24),GridItem(.flexible(), spacing: 24),GridItem(.flexible())], spacing: 20){
                            ForEach(alkwjAJeiwnbgProducts, id: \.self.tierjAHncalPrice) { prod in
                                ZStack(alignment: .topLeading){
                                    UnevenRoundedRectangle(
                                        bottomLeadingRadius: 20,
                                        bottomTrailingRadius: 20
                                    ).fill(LinearGradient(colors: [
                                        Color(red: 1, green: 150/255, blue: 232/255),
                                        .white
                                    ], startPoint: .top, endPoint: .bottom))
                                        .frame(height: 88)
                                        .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                                        .overlay{
                                            VStack(spacing: 2){
                                                Image("klahgw_coin")
                                                    .resizable()
                                                    .frame(width: 24, height: 27)
                                                Text("\(prod.tierjAHncalGetDiamond)")
                                                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                                            }
                                        }
                                        .padding(.top, 12)
                                    
                                    Image("uytvjhfufGH")
                                        .resizable()
                                        .frame(width: 72, height: 24)
                                        .overlay{
                                            Text("$\(String(format: "%.2f", prod.tierjAHncalPrice))")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading, 15)
                                        }
                                }.onTapGesture {
                                    kahsuWalletIpa.bneualIWlaRecharge(prod) {result in
                                        switch result {
                                        case .success(let diamond):
                                            kahsuUserVM.increaseUserDiamond(diamond: diamond)
                                            kahsuUserVM.loadLoginXawuxLAiwMUser()
                                            DwhaiXeuHUD.toast(.success("Purchase success"))
                                        case .cancelled:
                                            DwhaiXeuHUD.toast(.normal("Purchase cancelled"))
                                        case .pending:
                                            return
                                        case .failed(let message):
                                            DwhaiXeuHUD.toast(.error("Faild: \(message)"))
                                        }
                                    }
                                    
                                }
                            }
                            
                        }.padding(.bottom, 30)
                    }.padding(.horizontal, 20)
                }
            }
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
    }
}
