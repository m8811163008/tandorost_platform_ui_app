package ir.tandorosta.poolakey_flutter

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.farsitel.bazaar.Poolakey.Payment
import com.farsitel.bazaar.Poolakey.config.PaymentConfiguration
import com.farsitel.bazaar.Poolakey.callback.PurchaseCallback
import com.farsitel.bazaar.Poolakey.callback.ConnectionCallback
import com.farsitel.bazaar.Poolakey.callback.ConsumeCallback
import com.farsitel.bazaar.Poolakey.callback.QueryCallback
import com.farsitel.bazaar.Poolakey.callback.CheckTrialSubscriptionCallback
import com.farsitel.bazaar.Poolakey.callback.ConnectionCallback as PoolakeyConnectionCallback
import com.farsitel.bazaar.Poolakey.config.SecurityCheck
import com.farsitel.bazaar.Poolakey.purchase.PurchaseRequest
import com.farsitel.bazaar.Poolakey.entity.PurchaseEntity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.EventChannel

class PoolakeyFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
  private lateinit var channel : MethodChannel
  private lateinit var eventChannel: EventChannel
  private var eventSink: EventChannel.EventSink? = null
  private var context: Context? = null
  private var activity: Activity? = null
  private lateinit var payment: Payment

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "poolakey_flutter")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "poolakey_flutter_events")
    eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
      override fun onListen(arguments: Any?, sink: EventChannel.EventSink?) {
        eventSink = sink
      }

      override fun onCancel(arguments: Any?) {
        eventSink = null
      }
    })
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "connect" -> {
        val rsaPublicKey = call.argument<String>("rsaPublicKey") ?: ""
        val securityCheck = SecurityCheck.Enable(rsaPublicKey)
        val paymentConfig = PaymentConfiguration(localSecurityCheck = securityCheck)
        
        payment = Payment(context!!, paymentConfig)

        payment.connect {
          connectionSucceed {
            result.success(true)
          }
          connectionFailed {
            result.error("CONNECTION_FAILED", it.message, null)
          }
          disconnected {
            eventSink?.success("disconnected")
          }
        }
      }
      "purchaseProduct" -> {
        if (activity == null) {
          result.error("ACTIVITY_UNAVAILABLE", "Activity is not available.", null)
          return
        }

        val productId = call.argument<String>("productId") ?: ""
        val payload = call.argument<String>("payload") ?: ""
        
        val purchaseRequest = PurchaseRequest(productId, payload)
        
        payment.purchaseProduct(
          activity!!,
          purchaseRequest
        ) {
          purchaseFlowBegan {
            // purchase flow began, but we don't return anything to Dart yet.
          }
          purchaseSucceed { purchaseEntity ->
            val data = mutableMapOf<String, Any>()
            data["type"] = "purchaseSucceed"
            data["purchaseToken"] = purchaseEntity.purchaseToken
            data["productId"] = purchaseEntity.productId
            result.success(data)
          }
          purchaseCanceled {
            result.error("PURCHASE_CANCELED", "User canceled the purchase.", null)
          }
          purchaseFailed {
            result.error("PURCHASE_FAILED", it.message, null)
          }
          failedToBeginFlow {
            result.error("FAILED_TO_BEGIN_FLOW", it.message, null)
          }
        }
      }
      "purchaseSubscription" -> {
        if (activity == null) {
          result.error("ACTIVITY_UNAVAILABLE", "Activity is not available.", null)
          return
        }
        val productId = call.argument<String>("productId") ?: ""
        val payload = call.argument<String>("payload") ?: ""
        
        val purchaseRequest = PurchaseRequest(productId, payload)

        payment.purchaseSubscription(
          activity!!,
          purchaseRequest
        ) {
          purchaseFlowBegan { }
          purchaseSucceed { purchaseEntity ->
            val data = mutableMapOf<String, Any>()
            data["type"] = "purchaseSucceed"
            data["purchaseToken"] = purchaseEntity.purchaseToken
            data["productId"] = purchaseEntity.productId
            result.success(data)
          }
          purchaseCanceled {
            result.error("PURCHASE_CANCELED", "User canceled the subscription purchase.", null)
          }
          purchaseFailed {
            result.error("PURCHASE_FAILED", it.message, null)
          }
          failedToBeginFlow {
            result.error("FAILED_TO_BEGIN_FLOW", it.message, null)
          }
        }
      }
      "consumeProduct" -> {
        val purchaseToken = call.argument<String>("purchaseToken") ?: ""
        payment.consumeProduct(purchaseToken) {
          consumeSucceed {
            result.success(true)
          }
          consumeFailed {
            result.error("CONSUME_FAILED", it.message, null)
          }
        }
      }
      "getPurchasedProducts" -> {
          payment.getPurchasedProducts {
              querySucceed { purchasedProducts ->
                  val productList = purchasedProducts.map { purchaseEntity ->
                      mapOf(
                          "productId" to purchaseEntity.productId,
                          "purchaseToken" to purchaseEntity.purchaseToken,
                          "purchaseTime" to purchaseEntity.purchaseTime,
                          "payload" to purchaseEntity.payload
                      )
                  }
                  result.success(productList)
              }
              queryFailed {
                  result.error("QUERY_FAILED", it.message, null)
              }
          }
      }
      "getSubscribedProducts" -> {
          payment.getSubscribedProducts {
              querySucceed { purchasedProducts ->
                  val productList = purchasedProducts.map { purchaseEntity ->
                      mapOf(
                          "productId" to purchaseEntity.productId,
                          "purchaseToken" to purchaseEntity.purchaseToken,
                          "purchaseTime" to purchaseEntity.purchaseTime,
                          "payload" to purchaseEntity.payload
                      )
                  }
                  result.success(productList)
              }
              queryFailed {
                  result.error("QUERY_FAILED", it.message, null)
              }
          }
      }
      "checkTrialSubscription" -> {
        payment.checkTrialSubscription {
          checkTrialSubscriptionSucceed { trialSubscriptionInfo ->
            val data = mutableMapOf<String, Any>()
            data["isAvailable"] = trialSubscriptionInfo.isAvailable
            data["trialPeriodDays"] = trialSubscriptionInfo.trialPeriodDays
            result.success(data)
          }
          checkTrialSubscriptionFailed {
            result.error("CHECK_TRIAL_FAILED", it.message, null)
          }
        }
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    eventChannel.setStreamHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    activity = null
    if (::payment.isInitialized) {
      payment.disconnect()
    }
  }
}