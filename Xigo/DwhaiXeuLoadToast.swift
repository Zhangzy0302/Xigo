import SwiftUI

enum DwhaiXeuHUDAction {
    case normal(String)
    case success(String)
    case error(String)
}

enum DwhaiXeuHUD {

    static func toast(_ action: DwhaiXeuHUDAction) {
        executeOnMain {
            switch action {
            case .normal(let text):
                DwhaiXeuLoadingToast.shared.showToast(text)

            case .success(let text):
                DwhaiXeuLoadingToast.shared.showToast(text, type: .success)

            case .error(let text):
                DwhaiXeuLoadingToast.shared.showToast(text, type: .error)
            }
        }
      }

    static func showLoading(showBackground: Bool = false) {
            executeOnMain {
                DwhaiXeuLoadingToast.shared.showLoading(showBackground: showBackground)
            }
        }

        static func hideLoading() {
            executeOnMain {
                DwhaiXeuLoadingToast.shared.hideLoading()
            }
        }

        private static func executeOnMain(
            _ action: @escaping @MainActor () -> Void
        ) {
            Task { @MainActor in
                action()
            }
        }
}

@MainActor
final class DwhaiXeuLoadingToast: ObservableObject {

    static let shared = DwhaiXeuLoadingToast()

    @Published var toast: DwhaiXeuToast?
    @Published var isLoading: Bool = false
    @Published var showBackground: Bool = false // ✅ 是否显示黑色半透明背景

    private init() {}

    func showToast(
        _ text: String,
        type: DwhaiXeuToastType = .normal,
        duration: TimeInterval = 1.8
    ) {
        toast = DwhaiXeuToast(text: text, type: type)

        Task {
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            self.toast = nil
        }
    }

    /// 显示 loading，可选择是否显示遮罩
    func showLoading(showBackground: Bool = false) {
        self.showBackground = showBackground
        isLoading = true
    }

    func hideLoading() {
        isLoading = false
        showBackground = false
    }
}


struct DwhaiXeuHUDView: View {

  @ObservedObject private var hud = DwhaiXeuLoadingToast.shared

  var body: some View {
    ZStack {
    // 🚫 Loading 时的点击拦截层
          if hud.isLoading {
              if hud.showBackground {
                  Color.black
                      .opacity(0.4) // 默认半透明，可调
                      .ignoresSafeArea()
              }else {
                  Color.black
                    .opacity(0.001) // 必须 > 0，否则不拦截事件
                    .ignoresSafeArea()
              }
            
          }
      // Loading
      if hud.isLoading {
        // 弹窗内容
        VStack(spacing: 22) {
          ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(1.4)
            .tint(.white)

          Text("Loading...")
            .foregroundColor(.white)
        }.frame(width: 120, height: 120)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255))
            .cornerRadius(20))
        .shadow(color: XigexcTheme.XigoColor.xiabalMainPink, radius: 4, y: 2)
        .padding(.horizontal, 40)

      }

      // Toast
      if let toast = hud.toast {
        VStack {
          Spacer()
            VStack(spacing: 16) {

            if let icon = toast.type.icon {
              Image(systemName: icon)
                    .frame(width: 30)
                    .foregroundColor(toast.type.backgroundColor)
            }

            Text(toast.text)
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.white)
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 14)
          .background(Color(red: 33 / 255, green: 33 / 255, blue: 33 / 255))
          .cornerRadius(20)
          .transition(.opacity.combined(with: .move(edge: .top)))

          Spacer()
        }
      }
    }
    .animation(.easeInOut, value: hud.isLoading)
  }
}

enum DwhaiXeuToastType {
  case normal
  case success
  case error

  var backgroundColor: Color {
    switch self {
    case .normal:
      return .white
    case .success:
      return .green
    case .error:
      return .red
    }
  }

  var icon: String? {
    switch self {
    case .success:
      return "checkmark.circle.fill"
    case .error:
      return "xmark.octagon.fill"
    default:
      return nil
    }
  }
}

struct DwhaiXeuToast {
  let text: String
  let type: DwhaiXeuToastType
}
