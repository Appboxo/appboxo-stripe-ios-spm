# Stripe Payment for Appboxo SDK

## Swift Package Manager installation

Add a package by selecting `File` → `Add Packages…` in Xcode’s menu bar.

Search for the AppBoxoStripe using the repo's URL:
    
    https://github.com/Appboxo/appboxo-stripe-ios-spm.git


Next, set the **Dependency Rule** to be `Up to Next Major Version`.

Then, select **Add Package**.
  

Init Appboxo and Stripe SDKs in your ViewController.

```swift
import AppBoxoSDK
import AppBoxoStripe
...

let config = Config(clientId: "client_id")
Appboxo.shared.setConfig(config: config)

AppboxoStripe.shared.publishableKey = "stripe_publishable_key"
AppboxoStripe.shared.merchantDisplayName = "App name" //for Stripe PaymentSheet
```

Setup a return URL. More about [return url](https://docs.stripe.com/payments/accept-a-payment?platform=ios#ios-set-up-return-url)

```swift
AppboxoStripe.shared.returnURL = "your-app://stripe-redirect"
```

Open miniapp in your ViewController

```swift
let miniapp = Appboxo.shared.getMiniapp(appId: "miniapp_id")

miniapp.delegate = self
miniapp.open(viewController: self)
```

Implement MiniappDelegate

```swift
extension ViewController : MiniappDelegate {
    func didReceivePaymentEvent(miniapp: Miniapp, paymentData: PaymentData) {
        AppboxoStripe.shared.handleStripePayment(miniapp: miniapp, paymentData: paymentData)
    }
    
    func onAuth(miniapp: Miniapp) {
        .. get auth_code from your backend
        miniapp.setAuthCode(authCode: "auth_code")
    }
}
```

## License

AppBoxo is available under the MIT license. See the LICENSE file for more info.
