
import Foundation
import Security

// MARK: - Key 定义
enum RaeyqZjxwaSecureKey {
    case raeyqZjxwaDevid, password

    var key: String {
        switch self {
        case .raeyqZjxwaDevid: return "raeyqZjxwaDevid1"
        case .password: return "password"
        }
    }
}

final class RaeyqZjxwaBInfoPer {

    static let shared = RaeyqZjxwaBInfoPer()
    private init() {}

    private func saveRaeyqZjxwaSecureKey(_ value: String, for key: RaeyqZjxwaSecureKey) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        delete(key) // 先删除旧值

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]

        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }

    private func readRaeyqZjxwaSecureKey(_ key: RaeyqZjxwaSecureKey) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var data: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &data)
        guard
            status == errSecSuccess,
            let resultData = data as? Data,
            let value = String(data: resultData, encoding: .utf8)
        else { return nil }
        return value
    }

    private func delete(_ key: RaeyqZjxwaSecureKey) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.key
        ]
        SecItemDelete(query as CFDictionary)
    }

    // MARK: - 直接属性访问
    var raeyqZjxwaDevid: String {
        get { readRaeyqZjxwaSecureKey(.raeyqZjxwaDevid) ?? "" }
        set { saveRaeyqZjxwaSecureKey(newValue, for: .raeyqZjxwaDevid) }
    }

    var password: String {
        get { readRaeyqZjxwaSecureKey(.password) ?? "" }
        set { saveRaeyqZjxwaSecureKey(newValue, for: .password) }
    }
}

// 卸载后不持久
enum WqigjxAkjjglriAppStorageKey {
  static let wqigjxAkjjglriIsB = "wqigjxAkjjglriIsB"
  static let wqigjxAkjjglriPushToken = "wqigjxAkjjglriPushToken"
  static let wqigjxAkjjglriH5Url = "wqigjxAkjjglriH5Url"
    static let wqigjxAkjjglriUserToken = "wqigjxAkjjglriUserToken"
}

final class WqigjxAkjjglriAppStorage {

  private static let ud = UserDefaults.standard

  static var wqigjxAkjjglriIsB: Bool {
    get { ud.bool(forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriIsB) }
    set { ud.set(newValue, forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriIsB) }
  }
    
    static var wqigjxAkjjglriUserToken: String {
      get { ud.string(forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriUserToken) ?? ""}
      set { ud.set(newValue, forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriUserToken) }
    }

  static var wqigjxAkjjglriPushToken: String {
    get { ud.string(forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriPushToken) ?? "" }
    set { ud.set(newValue, forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriPushToken) }
  }

  static var wqigjxAkjjglriH5Url: String {
    get { ud.string(forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriH5Url) ?? "" }
    set { ud.set(newValue, forKey: WqigjxAkjjglriAppStorageKey.wqigjxAkjjglriH5Url) }
  }
}

var pwoaixAcxwisUsersOrdercode: String = ""
