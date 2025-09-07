import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'poolakey_flutter_method_channel.dart';

abstract class PoolakeyFlutterPlatform extends PlatformInterface {
  /// Constructs a PoolakeyFlutterPlatform.
  PoolakeyFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PoolakeyFlutterPlatform _instance = MethodChannelPoolakeyFlutter();

  /// The default instance of [PoolakeyFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelPoolakeyFlutter].
  static PoolakeyFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PoolakeyFlutterPlatform] when
  /// they register themselves.
  static set instance(PoolakeyFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
