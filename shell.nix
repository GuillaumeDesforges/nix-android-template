let
  pkgs = import ./nix/nixpkgs.nix {};

  android = pkgs.androidenv.composeAndroidPackages {
    # toolsVersion = "25.2.5";
    # platformToolsVersion = "27.0.1";
    platformVersions = [ "29" ];
    buildToolsVersions = [ "29.0.2" ];
  };
in
pkgs.mkShell {
  buildInputs = [
    pkgs.gradle
    pkgs.jdk
    android.androidsdk
  ];

  ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
}
