import SwiftUI

enum DwhaiXeuHUD {

  static func toast(_ text: String) {
    executeOnMain {
      DwhaiXeuLoadingToast.shared.showToast(text)
    }
  }

  static func success(_ text: String) {
    executeOnMain {
      DwhaiXeuLoadingToast.shared.showToast(text, type: .success)
    }
  }

  static func error(_ text: String) {
    executeOnMain {
      DwhaiXeuLoadingToast.shared.showToast(text, type: .error)
    }
  }

  static func showLoading() {
    executeOnMain {
      DwhaiXeuLoadingToast.shared.showLoading()
    }
  }

  static func hideLoading() {
    executeOnMain {
      DwhaiXeuLoadingToast.shared.hideLoading()
    }
  }

  // MARK: - MainActor 调度统一入口
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

  func showLoading() {
    isLoading = true
  }

  func hideLoading() {
    isLoading = false
  }
}


struct DwhaiXeuHUDView: View {

  @ObservedObject private var hud = DwhaiXeuLoadingToast.shared

  var body: some View {
    ZStack {
    // 🚫 Loading 时的点击拦截层
          if hud.isLoading {
            Color.black
              .opacity(0.001) // 必须 > 0，否则不拦截事件
              .ignoresSafeArea()
          }
      // Loading
      if hud.isLoading {
        // 弹窗内容
        VStack(spacing: 12) {
          ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(1.4)
            .tint(.white)

          Text("Loading...")
            .foregroundColor(.white)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(.black.opacity(0.9))
            .frame(width: 120, height: 120)
            .blur(radius: 6)
            .cornerRadius(20))
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
                .foregroundColor(.white)
            }

            Text(toast.text)
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.white)
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 14)
          .background(toast.type.backgroundColor)
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
      return .black.opacity(0.9)
    case .success:
      return .green.opacity(0.9)
    case .error:
      return .red.opacity(0.9)
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
