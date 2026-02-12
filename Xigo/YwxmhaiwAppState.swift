import SwiftUI

final class YwxmhaiwAppState {

  private init() {}

  private static let defaults = UserDefaults.standard

  static var ywxmhaiwIsAgree: Bool {
    get { defaults.bool(forKey: "ywxmhaiwIsAgree") }
    set { defaults.set(newValue, forKey: "ywxmhaiwIsAgree") }
  }
    
    static var ywxmhaiwIsEULAAgree: Bool {
      get { defaults.bool(forKey: "ywxmhaiwIsEULAAgree") }
      set { defaults.set(newValue, forKey: "ywxmhaiwIsEULAAgree") }
    }
}

