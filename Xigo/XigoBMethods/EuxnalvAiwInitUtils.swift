import CoreLocation
import Foundation
import SwiftUI
import UIKit

final class EuxnalvAiwInitUtils {

  static let shared = EuxnalvAiwInitUtils()
  private init() {}

  var pwoaixAcxwisApiCallRes: [String: Any]?
  var pwoaixAcxwisIsGetLocation: Bool = true

  func pwoaixAcxwisJudgeMorning() async {
    do {
      pwoaixAcxwisApiCallRes = try await GhsuqJduwApiCall().ghsuqJduwGetDf()
    } catch {
      // 忽略错误（与原逻辑一致）
    }
  }
  func pwoaixAcxwisGoLogin() async -> UxzuaAppRoute? {
    do {

      if pwoaixAcxwisIsGetLocation {
        try await handleLocation()
      }

      guard let response = try await GhsuqJduwApiCall().ghsuqJduwQuickLogin() else {
          DwhaiXeuHUD.toast(.error("error"))
        return nil
      }

      return await processLoginResponse(response)

    } catch {
        DwhaiXeuHUD.toast(.error("error"))
      return nil
    }
  }

  func handleLocation() async throws {

    guard
      let placemark = await UxyqhHhwiaLocationManager.shared
        .pwoaixAcxwisGetCurrentLocationAndAddress()
    else {
      throw NSError(domain: "LocationError", code: -1)
    }

    if let location = placemark.location {
      HxwuqHgeywcGetPhoneInfo.shared.latitude = location.coordinate.latitude
      HxwuqHgeywcGetPhoneInfo.shared.longitude = location.coordinate.longitude
    }
  }

  func processLoginResponse(_ response: [String: Any]) async -> UxzuaAppRoute? {

    guard let code = response["code"] as? String else { return nil }

    if code != "0000" {
        DwhaiXeuHUD.toast(.error("Login Error"))
      return nil
    }

    guard let resultEncrypted = response["result"] as? String else { return nil }

    let decrypted = resultEncrypted.hxwuqHgeywcBDecrypt()

    guard let jsonData = decrypted.data(using: .utf8),
      let resultDict = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
    else { return nil }

    await updateUserState(resultDict)

    let url = HxwuqHgeywcInformationCreate.pwoaixAcxwisBuildH5Url(
      baseUrl: WqigjxAkjjglriAppStorage.wqigjxAkjjglriH5Url,
      token: WqigjxAkjjglriAppStorage.wqigjxAkjjglriUserToken
    )

    print("h5url: \(url) ------end")

      return UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: url)
  }

  func updateUserState(_ result: [String: Any]) async {

    if RaeyqZjxwaBInfoPer.shared.password.isEmpty,
      let password = result["password"] as? String
    {
      RaeyqZjxwaBInfoPer.shared.password = password
    }

    if let token = result["token"] as? String {
        WqigjxAkjjglriAppStorage.wqigjxAkjjglriUserToken = token
//        RaeyqZjxwaBInfoPer.saveUserToken(token)
    }
  }

  func pwoaixAcxwisHandleDeviceAndPolling() async {

    await pwoaixAcxwisJudgeMorning()

    let pollingInterval: UInt64 = 2_000_000_000
    let maxErrorInterval: UInt64 = 10_000_000_000

    var elapsed: UInt64 = 0

    while pwoaixAcxwisApiCallRes == nil {

      try? await Task.sleep(nanoseconds: pollingInterval)
      elapsed += pollingInterval

      await pwoaixAcxwisJudgeMorning()

      if elapsed >= maxErrorInterval {
        elapsed = 0
          DwhaiXeuHUD.toast(.error("Network Error"))
      }
    }
  }
}

enum SdeiqoAHhggInitType {
  case loading
  case ncjjalAiwlisB
  case ncjjalAiwlisA
}

@MainActor
final class EwuxbakAUkxBInitVModel: ObservableObject {

  @Published var pwoaixAcxwisStatus: SdeiqoAHhggInitType = .loading
  @Published var pwoaixAcxwisNextRoute: UxzuaAppRoute?

  private let euxnalvAiwInitUtils = EuxnalvAiwInitUtils.shared

  // MARK: - 主入口
  func arieAkdliwaBInit() async {
    await HxwuqHgeywcGetPhoneInfo.shared.hxwuqHgeywcGetPhoneInfo()
    await euxnalvAiwInitUtils.pwoaixAcxwisHandleDeviceAndPolling()
    await pwoaixAcxwisProcessApiResponse()
  }

  //处理 API 响应
  func pwoaixAcxwisProcessApiResponse() async {

    guard isResponseValid() else {
      setFailureStatus()
      return
    }

    WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB = true

    let decryptedData = pwoaixAcxwisDecryptResult()
    print("openValue: \(decryptedData["openValue"] ?? "null")")
    WqigjxAkjjglriAppStorage.wqigjxAkjjglriH5Url = decryptedData["openValue"] as? String ?? ""

    let loginFlag = decryptedData["loginFlag"] as? Int ?? 0
      let hasLogin = loginFlag == 1 && !WqigjxAkjjglriAppStorage.wqigjxAkjjglriUserToken.isEmpty

    if hasLogin {
      let route = await pwoaixAcxwisHeaterRegistrationAndRedirect()

      pwoaixAcxwisNextRoute = route
    } else {
      await pwoaixAcxwisHandleLocationFlow(decryptedData)
    }
  }

  //校验响应
  private func isResponseValid() -> Bool {
    guard let res = euxnalvAiwInitUtils.pwoaixAcxwisApiCallRes else {
      return false
    }
    print(res)
    return (res["code"] as? String) == "0000"
  }

  //解密数据
  private func pwoaixAcxwisDecryptResult() -> [String: Any] {
    guard let resultString = euxnalvAiwInitUtils.pwoaixAcxwisApiCallRes?["result"] as? String
    else {
      return [:]
    }

    let decryptedString = resultString.hxwuqHgeywcBDecrypt()

    guard let jsonData = decryptedString.data(using: .utf8) else {
      return [:]
    }

    guard let resultDict = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
    else {
      return [:]
    }
    return resultDict
  }

  //处理定位流程
  private func pwoaixAcxwisHandleLocationFlow(_ decryptedData: [String: Any]) async {

    let locationFlag = decryptedData["locationFlag"] as? Int ?? 0

    euxnalvAiwInitUtils.pwoaixAcxwisIsGetLocation = (locationFlag == 1)

    if euxnalvAiwInitUtils.pwoaixAcxwisIsGetLocation {
      _ = await UxyqhHhwiaLocationManager.shared.pwoaixAcxwisCheckAndRequestLocation()
    }

    pwoaixAcxwisUpdateStatus(.ncjjalAiwlisB)
  }

  //✅ 7️⃣ 失败状态
  private func setFailureStatus() {
    pwoaixAcxwisUpdateStatus(.ncjjalAiwlisA)
  }

  //✅ 8️⃣ 成功跳转
  func pwoaixAcxwisHeaterRegistrationAndRedirect() async -> UxzuaAppRoute {
    let url = HxwuqHgeywcInformationCreate.pwoaixAcxwisBuildH5Url(
      baseUrl: WqigjxAkjjglriAppStorage.wqigjxAkjjglriH5Url,
      token: WqigjxAkjjglriAppStorage.wqigjxAkjjglriUserToken
    )
      return UxzuaAppRoute.uebzdxnzAgreement(uehvzUrl: url)
  }

  //✅ 9️⃣ 状态更新
  private func pwoaixAcxwisUpdateStatus(_ status: SdeiqoAHhggInitType) {
    pwoaixAcxwisStatus = status
  }

  // 初始化流程（等价 initState）
  func pwoaixAcxwisInitFlow() async {
    // 修复点1：处理日期组件的可选值（原代码强制解包! 有崩溃风险）
    guard
      let targetDate = Calendar.current.date(
        from: HxwuqHgeywcInformationCreate.pwoaixAcxwisVertifyDate)
    else {
      // 日期解析失败时的兜底逻辑
      pwoaixAcxwisUpdateStatus(.ncjjalAiwlisA)
      return
    }

    // 修复点2：替换不存在的 isBefore 方法（用 Date 的比较运算符实现）
    let currentDate = Date()
    let isTimeOver = !(currentDate < targetDate)  // currentDate >= targetDate 即时间已过

    if !isTimeOver {
      pwoaixAcxwisUpdateStatus(.ncjjalAiwlisA)
      return
    }
    WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB = false
    if !WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB {
      await arieAkdliwaBInit()

    } else {
      pwoaixAcxwisUpdateStatus(.ncjjalAiwlisB)
    }
  }
}
