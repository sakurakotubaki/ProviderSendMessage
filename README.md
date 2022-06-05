## Firebaseの学習サンプル

## Androidに追加する設定
https://developer.android.com/studio/build/multidex?hl=ja
AndroidのFirebaseの設定が変わっていた?
https://tns-blog.com/261

app/build.gradle
```
defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId "com.example.messagesApp"  // google-services.jsonの"package_name": "com.example.messagesApp"と同じにする
    // You can update the following values to match your application needs.
    // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-build-configuration.
    minSdkVersion 21 // 21に設定
    targetSdkVersion 31 // 31に設定
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
    multiDexEnabled true // Android公式より追加
    }
```
google-services.json
```
{
  "project_info": {
    "project_number": "870802808383",
    "project_id": "flutter-demo007-f14d2",
    "storage_bucket": "flutter-demo007-f14d2.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:870802808383:android:9d0646122b24c36e58628a",
        "android_client_info": {
          "package_name": "com.example.messagesApp" // こちらをapp/build.gradleのapplicationIdにコピーアンドペーストする
        }
      },
```