package ir.tandorost_a.tandorost

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity(){
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "ir.tandorost_a.tandorost/widget")
            .setMethodCallHandler { call, result ->
                if (call.method == "requestAddHomeWidget") {
                    requestAddHomeWidget(this)
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }
}
