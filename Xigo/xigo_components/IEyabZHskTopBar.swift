import SwiftUI

struct IEyabZHskTopBar<Action: View>: View {
    var iealkaTitle: String
    @ViewBuilder let ietamxAction: () -> Action
    
    @EnvironmentObject var eainxaPath: UxzuaNaaviManer
    
    init(iealkaTitle: String = "", ietamxAction: @escaping () -> Action = {Spacer()}) {
        self.iealkaTitle = iealkaTitle
        self.ietamxAction = ietamxAction
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(iealkaTitle)
                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                    .foregroundColor(.white)
                    .transformEffect(.init(a: 1, b: 0, c: -0.25, d: 1, tx: 0, ty: 0))
                Spacer()
            }
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background{
                        Circle()
                            .fill(.white.opacity(0.2))
                            
                    }.onTapGesture {
                        eainxaPath.pop()
                    }
                Spacer()
                ietamxAction()
            }
            
            
        }.padding(.horizontal, 20)
            .padding(.vertical, 7)
    }
}
