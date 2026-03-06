import SwiftUI

struct WxznaWYaUserList: View {
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            VStack {
                IEyabZHskTopBar(iealkaTitle: "Fan")
                LazyVStack {
                    HStack(spacing: 12){
                        Circle()
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 60,height: 60)
                            .overlay{
                                Circle()
                                    .fill(.black)
                                    .frame(width: 48, height: 48)
                            }
                        Text("Mary")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .extraBold))
                        Spacer()
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 102, height: 31)
                            .overlay{
                                Text("Back")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                    .foregroundColor(.white)
                            }
                    }.padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.opacity(0.2))
                            
                                
                        ).padding(.horizontal, 20)
                }
            }
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    WxznaWYaUserList()
}
