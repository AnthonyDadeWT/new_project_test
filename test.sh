output="../build/ios_integ"
product="build/ios_integ/Build/Products"
# Pass --simulator if building for the simulator.
flutter build ios -t integration_test/example_test.dart --release
pushd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -config Flutter/Release.xcconfig -derivedDataPath $output -sdk iphoneos build-for-testing
popd
pushd $product
# Provide the xctestrun filename present at build output path build/ios_integration/Build/Products. eg. Runner_iphoneos16.2-arm64.xctestrun
zip -r "ios_tests.zip" "Release-iphoneos" "Runner_iphoneos17.0-arm64.xctestrun"

ls

curl -u "willowtree1:ztSoNK3ndGa5TjxMGZF6" \
    -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/ios/test-package" \
    -F "file=@./ios_tests.zip"

curl -u "willowtree1:ztSoNK3ndGa5TjxMGZF6" \
    -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/ios/build" \
    -d '{"devices": ["iPhone 14 Pro Max-16"], "testPackage":"bs://3f8ca850476a7c26d4698225e32b353c83cac7ed","networkLogs":"true","deviceLogs":"true"}' \
    -H "Content-Type: application/json"
