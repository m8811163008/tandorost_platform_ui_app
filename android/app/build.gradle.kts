plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

allprojects {
    repositories {
        maven(url = "https://jitpack.io")
        google()
        maven(url = "https://plugins.gradle.org/m2/")
        maven(url = "https://maven.google.com/") {
            name = "Google"
        }
    }
}

android {
    namespace = "ir.tandorost_a.tandorost"
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    buildFeatures {
        buildConfig = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "ir.tandorost_a.tandorost"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdkVersion(flutter.minSdkVersion)
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = "upload"
            keyPassword = "tandorost_dev"
            storeFile = file("../../key_store/tandorost.jks")
            storePassword = "tandorost_dev"
        }
    }
    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true // Enable code shrinking
            isShrinkResources = true // Enable resource shrinking
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("release")
        }
    }
    buildFeatures {
        viewBinding = true
    }
}
dependencies {
    // ...existing code...
    implementation("com.github.cafebazaar.Poolakey:poolakey-rx3:2.2.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")
    implementation("com.google.android.gms:play-services-auth:21.0.0")
}
flutter {
    source = "../.."
}
