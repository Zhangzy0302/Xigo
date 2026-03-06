import SwiftUI

struct NVbzajaAldaCosShare: View {
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
            VStack(spacing: 0) {
                IEyabZHskTopBar(iealkaTitle: "Hot cosplayer user")
                ScrollView(.horizontal) {
                    LazyHStack {
                        HStack {
                            Spacer()
                            VStack {
                                Text("Caelan York")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                                Circle().frame(width: 44)
                            }
                            Spacer()
                            Rectangle()
                                .frame(width: 38)
                        }.frame(width: 127, height: 78)
                            .background(RoundedRectangle(cornerRadius: 20)
                                .fill(.white))
                            .cornerRadius(20)
                    }.padding(.horizontal, 20)
                }.frame(height: 78)
                    .padding(.bottom, 24)
                    .padding(.top, 13)
                HStack {
                    Image("xnawukaAUwa")
                        .resizable()
                        .frame(width: 110, height: 42)
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 69, height: 42)
                        .overlay{
                            Image(systemName: "plus")
                                .font(.system(size: 22))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                }.padding(.horizontal, 20)
                    .padding(.bottom, 17)
                ScrollView {
                    LazyVStack(spacing: 24) {
                        WUnczAHwjPicCard()
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.frame(maxHeight: .infinity)
        }.navigationBarHidden(true)
    }
}

#Preview {
    NVbzajaAldaCosShare()
}
