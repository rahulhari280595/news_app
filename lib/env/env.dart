import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'NEWS_KEY', obfuscate: true)
  static final newsApiKey = _Env.newsApiKey;
}