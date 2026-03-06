import SwiftUI

struct JayuwalReportBlock: View {
    @Binding var jayuwalIsShowBlock: Bool
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image("klahgw_block_bg")
                .resizable()
                .frame(width: 224, height: 214)
            VStack(spacing: 10){
                Text("Report")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                    .foregroundColor(.white)
                    .frame(width: 180, height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 97/255, green: 97/255, blue: 97/255))
                    ).onTapGesture {
                        
                    }
                Text("Shield")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                    .foregroundColor(.white)
                    .frame(width: 180, height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 97/255, green: 97/255, blue: 97/255))
                    ).onTapGesture {
                        
                    }
                Text("Cancel")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .extraBold))
                    .foregroundColor(.white)
                    .frame(width: 180, height: 42)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(red: 97/255, green: 97/255, blue: 97/255))
                    ).onTapGesture {
                        jayuwalIsShowBlock = false
                    }
            }.padding(.bottom, 24)
        }
    }
}
