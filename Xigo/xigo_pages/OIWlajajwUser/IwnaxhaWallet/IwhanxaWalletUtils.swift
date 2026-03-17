
import StoreKit
import SwiftUI

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

    // MARK: - 拉取商品
    func psieAJxaloietchProducts() {

        guard xcmnueProducnsts.isEmpty else { return }

        let ids = Set(alkwjAJeiwnbgProducts.map { $0.tierjAHncalKeyId })

        request = SKProductsRequest(productIdentifiers: ids)
        request?.delegate = self
        request?.start()
    }

    // MARK: - 购买
    func bneualIWlaRecharge(
            _ lwhancxaPro: IwhanxaProduct,
            completion: @escaping (IwhanxaPurchaseResult) -> Void
        ) {
            guard SKPaymentQueue.canMakePayments() else {
                completion(.failed(message: "Payments not allowed"))
                return
            }
            
            guard let product = xcmnueProducnsts.first(where: { $0.productIdentifier == lwhancxaPro.tierjAHncalKeyId }) else {
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
            self.xcmnueProducnsts = response.products
            print("Loaded xcmnueProducnsts:", response.products.map { $0.productIdentifier })
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        DwhaiXeuHUD.toast(.error("Load xcmnueProducnsts failed: \(error.localizedDescription)"))
    }
}

extension IwhanxaIAPManager: SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            switch transaction.transactionState {
                
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                DwhaiXeuHUD.hideLoading()
                
                if let lwhancxaPro = alkwjAJeiwnbgProducts.first(where: {
                    $0.tierjAHncalKeyId == transaction.payment.productIdentifier
                }) {
                    cjehALuwnxCompeltion?(.success(diamond: lwhancxaPro.tierjAHncalGetDiamond))
                }
                cjehALuwnxCompeltion = nil
                
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
