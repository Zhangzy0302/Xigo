import SwiftUI

struct KahxuwaofWallet: View {
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
                    VStack{
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
                                            Text("2080")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                                        }
                                    }.padding(.horizontal, 20)
                                        .padding(.top, 16)
                                    Spacer()
                                }
                            }
                        
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
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
                                        VStack{
                                            Image("klahgw_coin")
                                                .resizable()
                                                .frame(width: 24, height: 27)
                                            Text("400")
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                                        }
                                    }
                                    .padding(.top, 12)
                                
                                Image("uytvjhfufGH")
                                    .resizable()
                                    .frame(width: 72, height: 24)
                                    .overlay{
                                        Text("$0.99")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 15)
                                    }
                            }
                        }
                    }.padding(.horizontal, 20)
                }
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    KahxuwaofWallet()
}
