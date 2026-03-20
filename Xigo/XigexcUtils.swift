import SwiftUI

enum XigexcTheme {
    enum XigoColor {
        static let xiabalMainPink = SwiftUI.Color(red: 1, green: 36 / 255, blue: 156 / 255)
        static let xiabalMainPurple = SwiftUI.Color(red: 108 / 255, green: 36 / 255, blue: 242 / 255)
        static let xiabalPinkPurpleGradient = LinearGradient(colors: [
            xiabalMainPink,
            xiabalMainPurple
        ], startPoint: .leading, endPoint: .trailing)
    }

    enum XigoFont {

            enum Weight {
                case regular
                case medium
                case semiBold
                case bold
                case extraBold
                case black
            }

            static func xiabalMainFont(
                _ size: CGFloat,
                weight: Weight = .regular
            ) -> Font {

                let fontName: String

                switch weight {
                case .regular:
                    fontName = "PlayfairDisplay-Regular"
                case .medium:
                    fontName = "PlayfairDisplay-Medium"
                case .semiBold:
                    fontName = "PlayfairDisplay-SemiBold"
                case .bold:
                    fontName = "PlayfairDisplay-Bold"
                case .extraBold:
                    fontName = "PlayfairDisplay-ExtraBold"
                case .black:
                    fontName = "PlayfairDisplay-Black"
                }

                return .custom(fontName, size: size)
            }
        }
}

enum XigoLocalImageManager {
  static func saveXigoImage(_ image: UIImage) -> String? {
    let xigoFileName = UUID().uuidString + ".jpg"
    let xigoData = image.jpegData(compressionQuality: 0.9)

    guard let xigoData else { return nil }

    let documentsURL = FileManager.default.urls(
      for: .documentDirectory,
      in: .userDomainMask
    ).first!

    let fileURL = documentsURL.appendingPathComponent(xigoFileName)

    do {
      try xigoData.write(to: fileURL)
      return fileURL.path  // ✅ 返回 String，正好给 ieujanMyAvatar 用
    } catch {
      print("Save image error:", error)
      return nil
    }
  }
}

struct XigOUWnalAHlkskDialog<Dialog: View>: View {
    @Binding var xigousIsShow: Bool
    @ViewBuilder let ouxnaDialog: () -> Dialog
    
    var body: some View {
        ZStack{
            if xigousIsShow {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        xigousIsShow = false
                    }
                ouxnaDialog()
            }
            
        }.animation(.easeInOut(duration: 0.2), value: xigousIsShow)
        
        
    }
}

struct XigexNoawEmptyData: View {
    let xigoexTopPadding: CGFloat?
    
    init(xigoexTopPadding: CGFloat = 10) {
        self.xigoexTopPadding = xigoexTopPadding
    }
    var body: some View {
        HStack{
            Spacer()
            Image("eiuaklaj_empty")
                .resizable()
                .frame(width: 154, height: 190)
            Spacer()
        }.padding()
            .padding(.top, xigoexTopPadding)
    }
}

func xiwandelay(_ seconds: Double) async {
  try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
}

// 桥接 UIKit 恢复手势
struct XiwanEnableSwipeBack: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        
        DispatchQueue.main.async {
            if let xiwLAKwjlxja = controller.navigationController {
                xiwLAKwjlxja.interactivePopGestureRecognizer?.isEnabled = true
                xiwLAKwjlxja.interactivePopGestureRecognizer?.delegate = nil
            }
        }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
