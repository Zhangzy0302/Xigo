
import AdjustSdk
import Alamofire
import Foundation
import StoreKit

final class GhsuqJduwApiCall {

  // MARK: - Base URL
  private let baseURL = "https://opi.v88yoi1f.link"

  // MARK: - Headers
  private var headers: HTTPHeaders {
    [
      "Content-Type": "application/json",
      "appVersion": HxwuqHgeywcInformationCreate.pwoaixAcxwisH5UrlrmationVersion,
      "deviceNo": RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid,
      "pushToken": WqigjxAkjjglriAppStorage.wqigjxAkjjglriPushToken,
      "loginToken": WqigjxAkjjglriAppStorage.wqigjxAkjjglriUserToken,
      "appId": HxwuqHgeywcInformationCreate.pwoaixAcxwisAppId,
    ]
  }

  // MARK: - Session
  private lazy var session: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.headers = .default
    return Session(configuration: configuration)
  }()
}

extension GhsuqJduwApiCall {

  func ghsuqJduwPayCall(
    purchaseID: String,
    serverVerificationData: String,
    orderCode: String
  ) async throws -> Bool {

    let body: [String: Any] = [
      "vneualkwiA12Lkwt": purchaseID,
      "cue28d188jsap": serverVerificationData,
      "saw398dhakjc": try jsonString(["orderCode": orderCode]),
    ]
    print("payload: \(body)")

    let data = try await ghsuqJduwRequest(
      path: "/opi/v1/xkjALwls314fdap",
      body: body
    )
    print("pay code: \(data?["code"] ?? "null")")

    return data?["code"] as? String == "0000"
  }

  func ghsuqJduwGetDf() async throws -> [String: Any]? {

    let cjueuAxlkalPhoneInfo = HxwuqHgeywcGetPhoneInfo.shared

    let body: [String: Any] = [
      "sAlwjd83jdad": 1,
      "ksaa83jalksn": cjueuAxlkalPhoneInfo.isVpnActive,
      "cjur8Ak28ase": cjueuAxlkalPhoneInfo.languages,
      "cjeq9ualvras": cjueuAxlkalPhoneInfo.coverAppList,
      "laskaLkx82ujt": cjueuAxlkalPhoneInfo.timezone,
      "cjw383kajkjck": cjueuAxlkalPhoneInfo.keyboards,
      "debug": 1,
    ]
      
    return try await ghsuqJduwRequest(
      path: "/opi/v1/akjAKjdlcjuo",
      body: body
    )
  }

  func ghsuqJduwQuickLogin() async throws -> [String: Any]? {

    let cjueuAxlkalPhoneInfo = HxwuqHgeywcGetPhoneInfo.shared

    let vnwhLAjxalAdID = await Adjust.adid()
    var body: [String: Any] = [
        "cialk892ilaxXa": vnwhLAjxalAdID ?? "",  // adjust ID
        "voieA9ial2kd": RaeyqZjxwaBInfoPer.shared.password,  // password
        "cpKAjx8akjfs2n": RaeyqZjxwaBInfoPer.shared.raeyqZjxwaDevid,
        "owuqkAJx62851dv": [
        "countryCode": cjueuAxlkalPhoneInfo.countryCode,
        "latitude": cjueuAxlkalPhoneInfo.latitude,
        "longitude": cjueuAxlkalPhoneInfo.longitude,
      ],
    ]

    if !RaeyqZjxwaBInfoPer.shared.password.isEmpty {
      body["jkAKjx829isd"] = RaeyqZjxwaBInfoPer.shared.password
    }

    return try await ghsuqJduwRequest(
      path: "/opi/v1/xkjwA92uakcl",
      body: body
    )
  }

  func ghsuqJduwLoadingTimeRecord(_ loadingTime: Int) async throws -> [String: Any]? {

    let body: [String: Any] = [
      "skjcjue198savcxo": "\(loadingTime)"
    ]

    return try await ghsuqJduwRequest(
      path: "/opi/v1/qqoieALkx12st",
      body: body
    )
  }
}

extension GhsuqJduwApiCall {

  fileprivate func ghsuqJduwRequest(
    path: String,
    body: [String: Any]
  ) async throws -> [String: Any]? {

    let jsonData = try JSONSerialization.data(withJSONObject: body)

    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
      return nil
    }

    // 🔐 AES CBC 加密 → hex
    let encryptedString = jsonString.hxwuqHgeywcBEncode()

    let response = try await session.request(
      baseURL + path,
      method: .post,
      parameters: nil,
      encoding: RawStringEncoding(string: encryptedString),
      headers: headers
    )
    .serializingData()
    .value

    return try ghsuqJduwParseResponse(response)
  }

  fileprivate func ghsuqJduwParseResponse(_ data: Data) throws -> [String: Any]? {
    let object = try JSONSerialization.jsonObject(with: data)

    if let dict = object as? [String: Any] {
      return dict
    }

    if let string = object as? String,
      let data = string.data(using: .utf8)
    {
      return try JSONSerialization.jsonObject(with: data) as? [String: Any]
    }

    return nil
  }

  fileprivate func jsonString(_ dict: [String: Any]) throws -> String {
    let data = try JSONSerialization.data(withJSONObject: dict)
    return String(data: data, encoding: .utf8) ?? ""
  }
}

struct RawStringEncoding: ParameterEncoding {

  let string: String

  func encode(
    _ urlRequest: URLRequestConvertible,
    with parameters: Parameters?
  ) throws -> URLRequest {

    var ghsuqJduwRequest = try urlRequest.asURLRequest()
    ghsuqJduwRequest.httpBody = string.data(using: .utf8)
    return ghsuqJduwRequest
  }
}
