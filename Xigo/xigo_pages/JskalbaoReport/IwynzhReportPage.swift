import SwiftUI

struct IwynzhReportPage: View {
    @State private var iwyxmaRText: String = ""
    @FocusState private var iwyaIsFocus: Bool
    
    let liwaynxReasons: [String] = [
        "Publishing pornographic/illegal information",
        "Fraudulent behavior of defrauding money",
        "Infringement of the rights and interests of minors",
        "Cyber bullying"
    ]
    @State private var lwayChosenOne: String = ""
    
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
                ZStack{
                    Text("What is the reason you want\n to report？")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .black))
                        .foregroundColor(.white)
                    IEyabZHskTopBar()
                }
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 24) {
                    ForEach(liwaynxReasons, id: \.self) { reson in
                        Text(reson)
                            .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .frame(height: 86)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                            )
                    }
                }.padding(.horizontal, 20)
                VStack(alignment: .leading){
                    Text("Details:")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                        .foregroundColor(.black)
                    TextField("He posted many violent pictures....", text: $iwyxmaRText)
                        .focused($iwyaIsFocus)
                        .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                        .foregroundColor(.black)
                        .tint(.black)
                        .padding()
                        .frame(height: 250, alignment: .topLeading)
                        .background(
                            RoundedRectangle(cornerRadius: 16.69)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
                        )
                }.padding(.horizontal, 20)
                    .padding(.vertical, 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(width: 144, height: 47)
                    .overlay{
                        Text("Confirm")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(20))
                            .foregroundColor(.white)
                    }
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    IwynzhReportPage()
}
