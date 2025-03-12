import 'package:flutter_3d_controller/src/data/datasources/flutter_3d_datasource_mobile.dart'
    if (dart.library.js) "package:flutter_3d_controller/src/data/datasources/flutter_3d_datasource_web.dart";

abstract class IFlutter3DDatasource {
  /// Causes animations to be played, Can be use to switch animations as well.
  /// If animationName is null and model has at list one animation, it will play first model's animation
  /// If animationName passed and not null it will play specific animation
  void playAnimation({String? animationName});

  /// Causes animations to be paused at current frame
  void pauseAnimation();

  /// Causes animation to be played from first frame
  void resetAnimation();

  /// Causes animation to be stopped
  void stopAnimation();

  /// It will return available animations list of 3D model as [List<String>]
  Future<List<String>> getAvailableAnimations();

  /// It will change Texture of 3D model
  /// Can be used to load desire Texture of 3D model
  void setTexture({required String textureName});

  /// It will return available 3D models texture as [List<String>]
  Future<List<String>> getAvailableTextures();

  ///It will change camera target
  void setCameraTarget(double x, double y, double z);

  /// Causes camera orbit reset to default value
  void resetCameraTarget();

  /// It will change camera orbit
  void setCameraOrbit(double theta, double phi, double radius);

  /// Causes camera target reset to default value
  void resetCameraOrbit();

  ///It will execute custom JS code
  void executeCustomJsCode(String code);

  ///It will execute custom JS code and returns result
  Future<dynamic> executeCustomJsCodeWithResult(String code);

  /// Cambia el peso de un morph target específico
  void setMorphTarget(
      {required String morphTargetName, required double weight});

  /// Restablece todos los morph targets a sus valores por defecto
  void resetMorphTargets();

  /// Obtiene la lista de morph targets disponibles en el modelo
  Future<List<String>> getAvailableMorphTargets();

  ///It will make specific instance of datasource per platform
  factory IFlutter3DDatasource(
          viewerId, webViewController, activeGestureInterceptor) =>
      Flutter3DDatasource(
          viewerId, webViewController, activeGestureInterceptor);
}
