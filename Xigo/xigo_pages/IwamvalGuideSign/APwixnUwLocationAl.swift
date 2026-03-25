import SwiftUI
import CoreLocation

struct APwixnUwLocationAl: View {
    @Binding var erunxAKwlwqIsShow: Bool
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var erunxAKwlwqIsCheckingSettings = false
    
    func erunxAKwlwqlGoToSettings() {
            erunxAKwlwqIsCheckingSettings = true
            
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(url)
        }

    func erunxAKwlwqlCheckLocatrion() {
        let manager = CLLocationManager()
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            erunxAKwlwqIsShow = false
        }
    }
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 0){
                Text("This app needs location access for sharing, discovering events, and using location-based features. Location data is used responsibly with your consent. Privacy and security are our priorities.")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .semiBold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 74)
                    .padding(.bottom, 24)
                    .padding(.horizontal, 19)
                VStack(spacing: 15){
                    Color.black.cornerRadius(10)
                        .frame(width: 129, height: 37)
                        .overlay{
                            Text("Go to settings")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14, weight: .extraBold))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            erunxAKwlwqlGoToSettings()
                        }
                    
                }
            }.frame(width: 257, height: 347)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [
                            Color(red: 250 / 255, green: 155 / 255, blue: 209 / 255),
                            Color.white,
                            Color(red: 116/255, green: 219/255, blue: 247/255)
                        ], startPoint: .top, endPoint: .bottom))
                        .overlay{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                        }
                )
                .padding(.top, 68)
            Image("cijwalkjxlka")
                .resizable()
                .frame(width: 114, height: 133)
                .padding(.trailing, 20)
        }.onChange(of: scenePhase) { newPhase in
            if newPhase == .active && erunxAKwlwqIsCheckingSettings {
                erunxAKwlwqIsCheckingSettings = false
                
                // 可选：重新检查权限
                erunxAKwlwqlCheckLocatrion()
            }
        }
    }
}
