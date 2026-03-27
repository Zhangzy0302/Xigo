//
//  mnhjfka_hswuq_b_utils.swift
//  Faio
//
//  Created by yangyang on 2026/2/25.
//

import CommonCrypto
import CoreLocation
import Foundation
import Network
import SwiftUI
import SystemConfiguration.CaptiveNetwork
import UIKit

extension String {

  // MARK: - Key & IV
//   private static let dravKey = "518486he8pzgbjsk"
//   private static let dravIV = "614436p28qzhkjsl"

  private static let dravKey = "eolji60ruwkq7sff"
  private static let dravIV = "62n5occrkr25xtqb"

  // MARK: - 加密
  func hxwuqHgeywcBEncode() -> String {
    guard let data = self.data(using: .utf8),
      let encrypted = hxwuqHgeywcAesCrypt(data: data, operation: CCOperation(kCCEncrypt))
    else {
      return ""
    }

    return encrypted.map { String(format: "%02x", $0) }.joined()
  }

  // MARK: - 解密
  func hxwuqHgeywcBDecrypt() -> String {
    guard let encryptedData = Data(hexString: self),
      let decrypted = hxwuqHgeywcAesCrypt(data: encryptedData, operation: CCOperation(kCCDecrypt)),
      let result = String(data: decrypted, encoding: .utf8)
    else {
      return ""
    }

    return result
  }

  // MARK: - Core AES
  private func hxwuqHgeywcAesCrypt(data: Data, operation: CCOperation) -> Data? {

    let keyData = Self.dravKey.data(using: .utf8)!
    let ivData = Self.dravIV.data(using: .utf8)!

    let dataLength = data.count
    let outLength = dataLength + kCCBlockSizeAES128

    var outBytes = Data(count: outLength)
    var finalLength = 0

    let status = outBytes.withUnsafeMutableBytes { outBytesPtr -> CCCryptorStatus in

      guard let outBase = outBytesPtr.baseAddress else { return CCCryptorStatus(kCCMemoryFailure) }

      return data.withUnsafeBytes { dataPtr in
        keyData.withUnsafeBytes { keyPtr in
          ivData.withUnsafeBytes { ivPtr in

            CCCrypt(
              operation,
              CCAlgorithm(kCCAlgorithmAES),
              CCOptions(kCCOptionPKCS7Padding),
              keyPtr.baseAddress,
              kCCKeySizeAES128,
              ivPtr.baseAddress,
              dataPtr.baseAddress,
              dataLength,
              outBase,
              outLength,
              &finalLength
            )
          }
        }
      }
    }

    guard status == kCCSuccess else { return nil }

    return outBytes.prefix(finalLength)
  }
}

extension Data {
  init?(hexString: String) {
    let len = hexString.count / 2
    var data = Data(capacity: len)

    var index = hexString.startIndex
    for _ in 0..<len {
      let nextIndex = hexString.index(index, offsetBy: 2)
      guard nextIndex <= hexString.endIndex else { return nil }

      let bytes = hexString[index..<nextIndex]
      guard let num = UInt8(bytes, radix: 16) else { return nil }

      data.append(num)
      index = nextIndex
    }

    self = data
  }
}

class HxwuqHgeywcInformationCreate {

//   static let pwoaixAcxwisAppId = "44332211"
    static let pwoaixAcxwisAppId: String = "27482241"
    static let pwoaixAcxwisH5UrlrmationVersion: String = "1.2.0"
    
    static let pwoaixAcxwisVertifyDate: DateComponents = DateComponents(
        year: 2026, month: 3, day: 29, hour: 12
      )

  static func pwoaixAcxwisBuildH5Url(baseUrl: String, token: String) -> String {
    let timestamp = Int(Date().timeIntervalSince1970 * 1000)

    let openParams: [String: Any] = [
      "token": token,
      "timestamp": timestamp,
    ]
    print(token)
    guard let jsonData = try? JSONSerialization.data(withJSONObject: openParams),
      let jsonString = String(data: jsonData, encoding: .utf8)
    else {
      return ""
    }

    let encoded = jsonString.hxwuqHgeywcBEncode()

    return "\(baseUrl)?openParams=\(encoded)&appId=\(pwoaixAcxwisAppId)"
  }
}

class UxyqhHhwiaLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {

  static let shared = UxyqhHhwiaLocationManager()
  @Published var showLocationDialog: Bool = false
  private let uxyqhHhwiaManager = CLLocationManager()
  private var uxyqhHhwiaLocationContinuation: CheckedContinuation<CLLocation, Error>?

  override init() {
    super.init()
    uxyqhHhwiaManager.delegate = self
    uxyqhHhwiaManager.desiredAccuracy = kCLLocationAccuracyBest
  }

  func pwoaixAcxwisGetCurrentLocationAndAddress() async -> CLPlacemark? {

    let einclIAWlaskjSuccess = await pwoaixAcxwisCheckAndRequestLocation()
    if !einclIAWlaskjSuccess { return nil }

    do {
      let location = try await uxyqhHhwiaGetCurrentLocation()
      let placemark = try await reverseGeocode(location)
      return placemark
    } catch {
        DwhaiXeuHUD.toast(.error("Positioning failed"))
      return nil
    }
  }

  func pwoaixAcxwisCheckAndRequestLocation() async -> Bool {

    // 1️⃣ 检查系统定位开关
    guard CLLocationManager.locationServicesEnabled() else {
      await showPermissionDialog()

      if !CLLocationManager.locationServicesEnabled() {
        showLocationServiceDisabledToast()
        return false
      }
      return false
    }

    // 2️⃣ 检查权限
    let status = uxyqhHhwiaManager.authorizationStatus

    if status == .denied || status == .restricted {
      await showPermissionDialog()

      let newStatus = uxyqhHhwiaManager.authorizationStatus
      if newStatus == .denied || newStatus == .restricted {
        return false
      }
    }

    if status == .notDetermined {
      uxyqhHhwiaManager.requestWhenInUseAuthorization()
      return true
    }

    return true
  }

  private func uxyqhHhwiaGetCurrentLocation() async throws -> CLLocation {
    try await withCheckedThrowingContinuation { continuation in
      self.uxyqhHhwiaLocationContinuation = continuation
      uxyqhHhwiaManager.requestLocation()
    }
  }

  func uxyqhHhwiaLocationManager(
    _ uxyqhHhwiaManager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {

    guard let location = locations.first else {
      uxyqhHhwiaLocationContinuation?.resume(throwing: NSError())
      return
    }

    uxyqhHhwiaLocationContinuation?.resume(returning: location)
    uxyqhHhwiaLocationContinuation = nil
  }

  func uxyqhHhwiaLocationManager(
    _ uxyqhHhwiaManager: CLLocationManager,
    didFailWithError error: Error
  ) {

    uxyqhHhwiaLocationContinuation?.resume(throwing: error)
    uxyqhHhwiaLocationContinuation = nil
  }

  private func reverseGeocode(_ location: CLLocation) async throws -> CLPlacemark? {

    try await withCheckedThrowingContinuation { continuation in

      CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in

        if let error = error {
          continuation.resume(throwing: error)
          return
        }

        continuation.resume(returning: placemarks?.first)
      }
    }
  }

  private func showLocationServiceDisabledToast() {
      DwhaiXeuHUD.toast(.error("Please enable system location services."))
  }

  @MainActor
  private func showPermissionDialog() async {
    // 这里触发你的 SwiftUI 弹窗
    showLocationDialog = true
  }
}

class HxwuqHgeywcGetPhoneInfo {

  static let shared = HxwuqHgeywcGetPhoneInfo()

  var languages: [String] = []
  var countryCode: String = ""
  var latitude: Double = 0
  var longitude: Double = 0
  var coverAppList: [String] = []
  var keyboards: [String] = []
  var timezone: String = ""
  var isVpnActive: Int = 0

  func hxwuqHgeywcGetPhoneInfo() async {

    await withTaskGroup(of: Void.self) { group in

      group.addTask { await self.hxwuqHgeywcGetLanguages() }
      group.addTask { await self.hxwuqHgeywcGetTimezone() }
      group.addTask { await self.hxwuqHgeywcGetInstalledApps() }
      group.addTask { await self.hxwuqHgeywcCheckVPN() }
      group.addTask {
        await self.hxwuqHgeywcGetSystemKeyboards()
      }
        if RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid.isEmpty {
            print("RaeyqZjxwaBInfoPer.getDevid: \(RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid)")
            group.addTask {
                RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid = await self.hxwuqHgeywcGetDeviceId(appId: HxwuqHgeywcInformationCreate.pwoaixAcxwisAppId)
            }
        }
      
    }
    // 所有任务执行完才会走到这里
    print("get phone info")
  }

  func hxwuqHgeywcGetLanguages() async {
    self.languages = Locale.preferredLanguages
  }

  func hxwuqHgeywcGetTimezone() async {
    self.timezone = TimeZone.current.identifier
  }

  func hxwuqHgeywcCheckVPN() async {

    var isVPN = false

    if let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
      let scopes = settings["__SCOPED__"] as? [String: Any]
    {

      for key in scopes.keys {
        if key.contains("tap") || key.contains("tun") || key.contains("ppp")
          || key.contains("ipsec")
        {
          isVPN = true
          break
        }
      }
    }

    self.isVpnActive = isVPN ? 1 : 0
  }

  func hxwuqHgeywcGetInstalledApps() async {

    var installed: [String] = []

    for app in pwoaixAcxwisApps {
      if let url = URL(string: "\(app.scheme)://"),
        await UIApplication.shared.canOpenURL(url)
      {
        installed.append(app.name)
      }
    }

    self.coverAppList = installed
  }

  func hxwuqHgeywcGetSystemKeyboards() async {
      await MainActor.run {
              let languages = UITextInputMode.activeInputModes.compactMap {
                  $0.primaryLanguage
              }
              self.keyboards = languages
          }
  }

  func hxwuqHgeywcGetDeviceId(appId: String) async -> String {

    let identifier = await UIDevice.current.identifierForVendor?.uuidString ?? ""
    return identifier + appId
  }
}

struct HxwuqHgeywcApp {
  let name: String
  let scheme: String
}

let pwoaixAcxwisApps = [
  HxwuqHgeywcApp(name: "WhatsApp", scheme: "whatsapp"),
  HxwuqHgeywcApp(name: "Instagram", scheme: "instagram"),
  HxwuqHgeywcApp(name: "Facebook", scheme: "fb"),
  HxwuqHgeywcApp(name: "TikTok", scheme: "tiktok"),
  HxwuqHgeywcApp(name: "GoogleMaps", scheme: "comgooglemaps"),
  HxwuqHgeywcApp(name: "twitter", scheme: "tweetie"),
  HxwuqHgeywcApp(name: "qq", scheme: "mqq"),
  HxwuqHgeywcApp(name: "weiChat", scheme: "wechat"),
  HxwuqHgeywcApp(name: "Aliapp", scheme: "alipay"),
]
