### Update bundle ID & Package name:
```s
flutter pub run change_app_package_name:main com.juniorise.parking
```

### Firebase:
```
firebase login
flutterfire configure
```

Ref: https://firebase.google.com/docs/flutter/setup


### Sha1
```
./gradlew signingReport
```

### Build runner
```
fvm flutter pub run build_runner build --delete-conflicting-outputs
```