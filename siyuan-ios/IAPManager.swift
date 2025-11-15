//
//  IAPManager.swift
//  siyuan-ios
//
//  Created by Vanessa on 2025/3/18.
//

import StoreKit
import Iosk
@available(iOS 15.0, *)
@MainActor
class IAPManager:ObservableObject {
    static let shared = IAPManager()
    private init() {}
    @Published var productID = ["china00", "china02", "00", "02"]  //  需要内购的产品ID数组
    @Published var products: [Product] = []    // 存储从 App Store 获取的内购商品信息
    // 视图自动加载loadProduct()方法
    // MODIFICATO: Disabilitato per evitare connessioni all'App Store
    func loadProduct() async {
        // PRIVACY: Questa funzione è stata disabilitata per evitare connessioni automatiche all'App Store
        // La connessione originale era: Product.products(for: productID)
        // Tutte le funzionalità pro sono già abilitate tramite loadPurchasedState()
        print("LoadProduct disabilitato - Modalità privacy attiva")
        // do {
        //     let fetchedProducts = try await Product.products(for: productID)
        //     if fetchedProducts.isEmpty {
        //         throw StoreError.IAPInformationIsEmpty
        //     }
        //     self.products = fetchedProducts
        //     print("成功加载产品: \(products)")
        // } catch {
        //     print("加载产品失败：\(error)")
        // }
    }
    // purchaseProduct：购买商品的方法，返回购买结果
    // MODIFICATO: Disabilitato per evitare connessioni all'App Store
    func purchaseProduct(_ product: Product, uuid:UUID) {
        // PRIVACY: Funzione disabilitata - nessuna connessione all'App Store
        // Tutte le funzionalità sono già sbloccate
        print("Purchase disabilitato - Modalità privacy attiva. Funzionalità già sbloccate.")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            // Simula successo senza connessione
            ViewController.syWebView.evaluateJavaScript("processIOSPurchaseResponse(1)")
        }
        // ORIGINALE DISABILITATO:
        // Task {  @MainActor in
        //     do {
        //         let result = try await product.purchase(options: [.appAccountToken(uuid)])
        //         switch result {
        //         case .success(let verification):
        //             let transaction = try checkVerified(verification)
        //             savePurchasedState(for: product.id)
        //             await transaction.finish()
        //             let response = Iosk.MobileVerifyAppStoreTransaction(uuid.uuidString, String(transaction.id));
        //             DispatchQueue.main.asyncAfter(deadline: .now()) {
        //                 ViewController.syWebView.evaluateJavaScript("processIOSPurchaseResponse(" + String(response) + ")")
        //             }
        //         case .userCancelled:
        //             DispatchQueue.main.asyncAfter(deadline: .now()) {
        //                 ViewController.syWebView.evaluateJavaScript("processIOSPurchaseResponse(-10)")
        //             }
        //         case .pending:
        //             DispatchQueue.main.asyncAfter(deadline: .now()) {
        //                 ViewController.syWebView.evaluateJavaScript("processIOSPurchaseResponse(-11)")
        //             }
        //         default:
        //             DispatchQueue.main.asyncAfter(deadline: .now()) {
        //                 ViewController.syWebView.evaluateJavaScript("processIOSPurchaseResponse(-12)")
        //             }
        //             throw StoreError.failedVerification
        //         }
        //     } catch {
        //         print("购买失败：\(error)")
        //         await resetProduct()
        //     }
        // }
    }
    // 验证购买结果
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:    // unverified校验失败，StoreKit不能确定交易有效
            print("校验购买结果失败")
            throw StoreError.failedVerification
        case .verified(let signedType):    // verfied校验成功
            print("校验购买结果成功")
            return signedType    // StoreKit确认本笔交易信息由苹果服务器合法签署
        }
    }
    // handleTransactions处理所有的交易情况
    // MODIFICATO: Disabilitato per evitare monitoraggio continuo App Store
    func handleTransactions() async {
        // PRIVACY: Questa funzione è stata disabilitata per evitare il monitoraggio continuo
        // delle transazioni che richiederebbe una connessione persistente all'App Store
        // Transaction.updates crea un AsyncSequence che contatta continuamente i server Apple
        print("HandleTransactions disabilitato - Modalità privacy attiva")
        // ORIGINALE DISABILITATO:
        // for await result in Transaction.updates {
        //     do {
        //         let transaction = try checkVerified(result)
        //         savePurchasedState(for: transaction.productID)
        //         await transaction.finish()
        //     } catch {
        //         print("交易处理失败：\(error)")
        //     }
        // }
    }
    // 当购买失败时，会尝试重新加载产品信息。
    func resetProduct() async {
        self.products = []
        await loadProduct()    // 调取loadProduct方法获取产品信息
    }
    // 保存购买状态到用户偏好设置或其他存储位置
    func savePurchasedState(for productID: String) {
        UserDefaults.standard.set(true, forKey: productID)
        print("Purchased state saved for product: \(productID)")
    }
    // 通过productID检查是否已完成购买
    // MODIFICATO: Ritorna sempre true per abilitare tutte le funzionalità pro
    func loadPurchasedState(for productID: String) -> Bool{
        // let isPurchased = UserDefaults.standard.bool(forKey: productID)    // UserDefaults读取购买状态
        let isPurchased = true    // MODIFICATO: Abilita sempre funzionalità pro
        print("Purchased state loaded for product: \(productID) - \(isPurchased)")
        return isPurchased    // 返回购买状态
    }
}
// 定义 throws 报错
enum StoreError: Error {
    case IAPInformationIsEmpty
    case failedVerification
}
