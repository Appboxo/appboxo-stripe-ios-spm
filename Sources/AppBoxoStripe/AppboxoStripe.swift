
// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import AppBoxoSDK
import StripePaymentSheet

public class AppboxoStripe: NSObject {
    @objc public static let shared = AppboxoStripe()
    
    @objc public var publishableKey = "" {
        didSet {
            StripeAPI.defaultPublishableKey = publishableKey
        }
    }
    @objc public var returnURL = ""
    @objc public var merchantDisplayName = ""
    
    @objc public func handleStripePayment(miniapp: Miniapp, paymentData: PaymentData) {
        guard let topViewController = UIApplication.topViewController() else { return }
        
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = merchantDisplayName
        
        if !returnURL.isEmpty {
            configuration.returnURL = returnURL
        }
        
        let paymentSheet = PaymentSheet(
            paymentIntentClientSecret: paymentData.transactionToken,
            configuration: configuration)
        
        paymentSheet.present(from: topViewController) { (paymentResult) in
            switch paymentResult {
            case .completed:
                paymentData.status = "success"
                miniapp.sendPaymentEvent(paymentData: paymentData)
            case .canceled:
                paymentData.status = "cancelled"
                miniapp.sendPaymentEvent(paymentData: paymentData)
            case .failed:
                paymentData.status = "failed"
                miniapp.sendPaymentEvent(paymentData: paymentData)
            }
        }
    }
}
