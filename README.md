# Stripe Payment for Boxo SDK

## Swift Package Manager installation

Add a package by selecting `File` → `Add Packages…` in Xcode’s menu bar.

Search for the BoxoStripe using the repo's URL:
    
    https://github.com/Appboxo/boxo-stripe-ios-spm.git


Next, set the **Dependency Rule** to be `Up to Next Major Version`.

Then, select **Add Package**.
  

Init Boxo and Stripe SDKs in your ViewController.

```swift
import BoxoSDK
import BoxoStripe
...

let config = Config(clientId: "client_id")
Boxo.shared.setConfig(config: config)

BoxoStripe.shared.publishableKey = "stripe_publishable_key"
BoxoStripe.shared.merchantDisplayName = "App name" //for Stripe PaymentSheet
```

Setup a return URL. More about [return url](https://docs.stripe.com/payments/accept-a-payment?platform=ios#ios-set-up-return-url)

```swift
BoxoStripe.shared.returnURL = "your-app://stripe-redirect"
```

Open miniapp in your ViewController

```swift
let miniapp = Boxo.shared.getMiniapp(appId: "miniapp_id")

miniapp.delegate = self
miniapp.open(viewController: self)
```

Implement MiniappDelegate

```swift
extension ViewController : MiniappDelegate {
    func didReceivePaymentEvent(miniapp: Miniapp, paymentData: PaymentData) {
        BoxoStripe.shared.handleStripePayment(miniapp: miniapp, paymentData: paymentData)
    }
    
    func onAuth(miniapp: Miniapp) {
        .. get auth_code from your backend
        miniapp.setAuthCode(authCode: "auth_code")
    }
}
```

## License

Boxo is available under the MIT license. See the LICENSE file for more info.
