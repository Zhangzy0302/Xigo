import SwiftUI

struct QawyaXmaEDit: View {
    @State private var qawayText: String = ""
    @FocusState private var qawayIsFocus: Bool
    
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
            Image("klahgw_change_avatar")
                .resizable()
                .frame(width: 72, height: 97)
                .padding(.top, 30)
                .padding(.leading, 100)
            VStack {
                IEyabZHskTopBar(iealkaTitle: "Edit information")
                ZStack(alignment: .top){
                    ZStack {
                        Circle()
                            .stroke(.white.opacity(0.7), lineWidth: 1)
                            .frame(width: 98, height: 98)
                        Circle()
                            .fill(.white)
                            .frame(width: 82, height: 82)
                    }
                    Image("xnwuAkuwaka")
                        .resizable()
                        .frame(height: 246)
                        
                        .overlay{
                            VStack(spacing: 24){
                                Text("Nickname")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                    .foregroundColor(.black)
                                TextField("Please enter", text: $qawayText)
                                    .focused($qawayIsFocus)
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                    .foregroundColor(.white)
                                    .tint(.white)
                                    .padding(.horizontal, 22)
                                    .frame(height: 62)
                                    .background(
                                        RoundedRectangle(cornerRadius: 31)
                                            .fill(.black)
                                    ).onTapGesture {
                                        qawayIsFocus = true
                                    }
                            }.padding(.horizontal, 25)
                        }.padding(.top, 69)
                }.padding(.horizontal, 20)
                    .padding(.top, 70)
                Spacer()
                if !qawayIsFocus {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 144, height: 47)
                        .overlay{
                            Text("Save")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                .foregroundColor(.white)
                        }.padding(.bottom, 40)
                }
                
            }
        }.onTapGesture {
            qawayIsFocus = false
        }.navigationBarHidden(true)
    }
}

#Preview {
    QawyaXmaEDit()
}
