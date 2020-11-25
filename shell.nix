{}:
let
  pkgs = import ./nix/nixpkgs.nix { config.android_sdk.accept_license = true; };

  mainBuildToolsVersion = "29.0.2";

  android = pkgs.androidenv.composeAndroidPackages {
    toolsVersion = "26.1.1";
    platformToolsVersion = "29.0.6";
    buildToolsVersions = [ mainBuildToolsVersion ];
    platformVersions = [ "29" ];
  };
in
pkgs.mkShell {
  buildInputs = [
    pkgs.gradle
    pkgs.jdk
    android.androidsdk
  ];

  ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${android.androidsdk}/libexec/android-sdk/build-tools/${mainBuildToolsVersion}/aapt2";
}
