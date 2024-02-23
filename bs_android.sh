ROOT=$(pwd)

# Go to the android folder which contains the "gradlew" script used for building Android apps from the terminal
pushd android
# Build an Android test APK (uses the MainActivityTest.java file created in step 1)
./gradlew app:assembleAndroidTest
# Build a debug APK by passing the integration test file
./gradlew app:assembleDebug -Ptarget="$ROOT/integration_test/foo_test.dart"
# Go back to the root of the project
popd


curl -u "willowtree1:ztSoNK3ndGa5TjxMGZF6" \
    -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/app" \
    -F "file=@./build/app/outputs/apk/debug/app-debug.apk"

curl -u "willowtree1:ztSoNK3ndGa5TjxMGZF6" \
    -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/test-suite" \
    -F "file=@./build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk"


curl -u "willowtree1:ztSoNK3ndGa5TjxMGZF6" \
    -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/build" \
    -d '{"app": "bs://dafcf04976b6d0bf794235730f659d5550bb287e", "testSuite": "bs://902df960e55720ef8f7087b8ff5144e58a3a9192", "devices": ["Samsung Galaxy S23 Ultra-13.0"]}' \
    -H "Content-Type: application/json" 