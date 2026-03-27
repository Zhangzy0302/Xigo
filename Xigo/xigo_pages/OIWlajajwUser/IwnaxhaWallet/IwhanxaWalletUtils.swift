
import StoreKit
import SwiftUI
import FBSDKCoreKit

struct IwhanxaProduct {
  let tierjAHncalKeyId: String
  let tierjAHncalGetDiamond: Int
  let tierjAHncalPrice: Double
}

let alkwjAJeiwnbgProducts: [IwhanxaProduct] = [
  IwhanxaProduct(
    tierjAHncalKeyId: "sttcjbtjtyhgqlau", tierjAHncalGetDiamond: 400, tierjAHncalPrice: 0.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "yjwgrtqvosbexcgo", tierjAHncalGetDiamond: 800, tierjAHncalPrice: 1.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "jlwmzqopvtnxarce", tierjAHncalGetDiamond: 1290, tierjAHncalPrice: 2.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "vsfzvdivciywjbvt", tierjAHncalGetDiamond: 2450, tierjAHncalPrice: 4.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "xkavmtrqplbnozye", tierjAHncalGetDiamond: 3950, tierjAHncalPrice: 7.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "mggoijtnjnwkniyq", tierjAHncalGetDiamond: 5150, tierjAHncalPrice: 9.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "dusqwrxkzjphlvae", tierjAHncalGetDiamond: 7400, tierjAHncalPrice: 14.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "dgbfuzfjjumhphwj", tierjAHncalGetDiamond: 10800, tierjAHncalPrice: 19.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "jjpynvzheswgatyq", tierjAHncalGetDiamond: 29400, tierjAHncalPrice: 49.99),
  IwhanxaProduct(
    tierjAHncalKeyId: "wkeiyyvplztyvhhk", tierjAHncalGetDiamond: 63700, tierjAHncalPrice: 99.99)
]


enum IwhanxaPurchaseResult {
    case success(diamond: Int)
    case cancelled
    case pending
    case failed(message: String)
}

class IwhanxaIAPManager: NSObject, ObservableObject {

    @Published var xcmnueProducnsts: [SKProduct] = []

    private var request: SKProductsRequest?
    
    // 当前购买回调
        private var cjehALuwnxCompeltion: ((IwhanxaPurchaseResult) -> Void)?

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    private var iwhanxaRetryCount = 0
    private var iwhanxaTotalRequestCount = 0
    private let iwhanxaMaxTotalRequestCount = 10
    private var iwhanxaMaxRetryCount = 10
    private var iwhanxaIsRequesting = false

    // MARK: - 拉取商品
    func psieAJxaloietchProducts() {
        
        // ✅ 最大请求次数限制
        guard iwhanxaTotalRequestCount < iwhanxaMaxTotalRequestCount else {
            return
        }
        
        // 防止重复请求
        guard !iwhanxaIsRequesting else { return }
        
        // 已有数据就不再请求
        guard xcmnueProducnsts.isEmpty else { return }
        
        iwhanxaIsRequesting = true
        iwhanxaTotalRequestCount += 1   // ✅ 每次请求都+1
        
        let ids = Set(alkwjAJeiwnbgProducts.map { $0.tierjAHncalKeyId })
        
        request = SKProductsRequest(productIdentifiers: ids)
        request?.delegate = self
        request?.start()
    }

    // MARK: - 购买
    func bneualIWlaRecharge(
        _ productKeyId: String,
            completion: @escaping (IwhanxaPurchaseResult) -> Void
        ) {
            guard SKPaymentQueue.canMakePayments() else {
                completion(.failed(message: "Payments not allowed"))
                return
            }
            
            guard let product = xcmnueProducnsts.first(where: { $0.productIdentifier == productKeyId }) else {
                completion(.failed(message: "Product not found"))
                return
            }
            
            DwhaiXeuHUD.showLoading(showBackground: true)
            
            // 保存回调
            self.cjehALuwnxCompeltion = completion
            
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
}

extension IwhanxaIAPManager: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

        DispatchQueue.main.async {
            self.iwhanxaIsRequesting = false
            self.iwhanxaRetryCount = 0   // ✅ 成功后清零
            
            self.xcmnueProducnsts = response.products
            
            print("Loaded:", response.products.map { $0.productIdentifier })
            
            // ⚠️ 如果一个都没拿到，也可以认为失败
            if response.products.isEmpty {
                self.iwhanxaRetryFetch()
            }
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        
        DispatchQueue.main.async {
            self.iwhanxaIsRequesting = false
            
            print("Load failed:", error.localizedDescription)
            
            self.iwhanxaRetryFetch()
        }
    }
    
    private func iwhanxaRetryFetch() {
        
        iwhanxaRetryCount += 1
        iwhanxaTotalRequestCount += 1   // ✅ 只在失败时累计
        
        guard iwhanxaRetryCount < iwhanxaMaxRetryCount,
              iwhanxaTotalRequestCount < iwhanxaMaxTotalRequestCount else {
            return
        }
        
        let delay = pow(2.0, Double(iwhanxaRetryCount))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.psieAJxaloietchProducts()
        }
    }
}

extension IwhanxaIAPManager: SKPaymentTransactionObserver {
    
    private func findWalletItem(productID: String) -> IwhanxaProduct? {
        alkwjAJeiwnbgProducts.first { $0.tierjAHncalKeyId == productID }
    }
    
    // MARK: - Facebook 埋点
    private func peiaWUkAKwuFBLog(price: Double) {
        AppEvents.shared.logPurchase(
            amount: price,
            currency: "USD",
            parameters: [AppEvents.ParameterName(rawValue: "fb_mobile_purchase"): "true"]
        )
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            switch transaction.transactionState {
                
            case .purchased:
                guard let model = findWalletItem(productID: transaction.payment.productIdentifier) else {
                    DwhaiXeuHUD.toast(.error("Product config not found"))
                    SKPaymentQueue.default().finishTransaction(transaction)
                    DwhaiXeuHUD.hideLoading()
                    return
                }
                if WqigjxAkjjglriAppStorage.wqigjxAkjjglriIsB {
                    Task{
                        let xiwalAWInxclakPurId = transaction.transactionIdentifier ?? ""
                        let cueAKwukfalVerificationData: String
                        if let receiptURL = Bundle.main.appStoreReceiptURL,
                           let receiptData = try? Data(contentsOf: receiptURL)
                        {
                            cueAKwukfalVerificationData = receiptData.base64EncodedString()
                        } else {
                            cueAKwukfalVerificationData = ""
                        }
                        let siueAKLuwxjeiVertify = try await GhsuqJduwApiCall().ghsuqJduwPayCall(
                            purchaseID: xiwalAWInxclakPurId,
                            serverVerificationData: cueAKwukfalVerificationData,  // StoreKit1 没有 JWS，通常传空或自签
                            orderCode: pwoaixAcxwisUsersOrdercode
                        )

                        if siueAKLuwxjeiVertify {
                            peiaWUkAKwuFBLog(price: model.tierjAHncalPrice) // fb
                            await UwhxAUBSKAdjustManager.shared.slwinxAiuwnTrackPurchase(dollar: model.tierjAHncalPrice) // adjust
                            SKPaymentQueue.default().finishTransaction(transaction)
//                            DwhaiXeuHUD.toast(.success("Purchase success"))
                        } else {
                            SKPaymentQueue.default().finishTransaction(transaction)
                            DwhaiXeuHUD.toast(.error("Purchase unverified"))
                        }

                        DwhaiXeuHUD.hideLoading()
                    }
                }else {
                    SKPaymentQueue.default().finishTransaction(transaction)
                    DwhaiXeuHUD.hideLoading()
                    
                    if let lwhancxaPro = alkwjAJeiwnbgProducts.first(where: {
                        $0.tierjAHncalKeyId == transaction.payment.productIdentifier
                    }) {
                        cjehALuwnxCompeltion?(.success(diamond: lwhancxaPro.tierjAHncalGetDiamond))
                    }
                    cjehALuwnxCompeltion = nil
                }
                
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                DwhaiXeuHUD.hideLoading()
                
                if let error = transaction.error as? SKError {
                    if error.code == .paymentCancelled {
                        cjehALuwnxCompeltion?(.cancelled)
                    } else {
                        cjehALuwnxCompeltion?(.failed(message: error.localizedDescription))
                    }
                } else {
                    cjehALuwnxCompeltion?(.failed(message: transaction.error?.localizedDescription ?? "Unknown error"))
                }
                cjehALuwnxCompeltion = nil
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                DwhaiXeuHUD.hideLoading()
                
            case .purchasing:
                break
                
            case .deferred:
                print("Purchase pending")
                cjehALuwnxCompeltion?(.pending)
            @unknown default:
                break
            }
        }
    }
}
