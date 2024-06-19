// swift-tools-version:5.9.0
import PackageDescription

let package = Package(
    name: "FFmpegKit",
    platforms: [.macOS(.v10_15), .macCatalyst(.v14), .iOS(.v13), .tvOS(.v13), .visionOS(.v1)],
    products: [
        .library(name: "FFmpegKit", targets: ["FFmpegKit"]),
        .library(name: "Libavcodec", targets: ["Libavcodec"]),
        .library(name: "Libavfilter", targets: ["Libavfilter"]),
        .library(name: "Libavformat", targets: ["Libavformat"]),
        .library(name: "Libavutil", targets: ["Libavutil"]),
        .library(name: "Libswresample", targets: ["Libswresample"]),
        .library(name: "Libswscale", targets: ["Libswscale"]),
        .library(name: "libass", targets: ["libfreetype", "libfribidi", "libharfbuzz", "libass"]),
        .library(name: "libmpv", targets: ["FFmpegKit", "libass", "libmpv"]),
        .executable(name: "ffmpeg", targets: ["ffmpeg"]),
        .executable(name: "ffplay", targets: ["ffplay"]),
        .executable(name: "ffprobe", targets: ["ffprobe"]),
    ],
    targets: [
        .target(name: "FFmpegKit",
                dependencies: [
                    "MoltenVK",
                    "libshaderc_combined",
                    "lcms2",
                    "libdav1d",
                    "libplacebo",
                    .target(name: "libzvbi", condition: .when(platforms: [.macOS, .iOS, .tvOS, .visionOS])),
                    "libsrt",
                    "libfreetype", "libfribidi", "libharfbuzz", "libass",
                    "libfontconfig",
                    .target(name: "libbluray", condition: .when(platforms: [.macOS])),
                    "gmp", "nettle", "hogweed", "gnutls",
                    "libsmbclient",
                    "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                ],
                linkerSettings: [
                    .linkedFramework("AudioToolbox"),
                    .linkedFramework("AVFAudio"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("CoreAudio"),
                    .linkedFramework("CoreVideo"),
                    .linkedFramework("CoreFoundation"),
                    .linkedFramework("CoreGraphics"),
                    .linkedFramework("CoreMedia"),
                    .linkedFramework("Cocoa", .when(platforms: [.macOS])),
                    .linkedFramework("DiskArbitration", .when(platforms: [.macOS])),
                    .linkedFramework("Foundation"),
                    .linkedFramework("Metal"),
                    .linkedFramework("IOKit", .when(platforms: [.macOS, .iOS, .visionOS, .macCatalyst])),
                    .linkedFramework("IOSurface"),
                    .linkedFramework("QuartzCore"),
                    .linkedFramework("Security"),
                    .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS, .visionOS, .macCatalyst])),
                    .linkedFramework("VideoToolbox"),
                    .linkedLibrary("bz2"),
                    .linkedLibrary("c++"),
                    .linkedLibrary("expat", .when(platforms: [.macOS])),
                    .linkedLibrary("iconv"),
                    .linkedLibrary("resolv"),
                    .linkedLibrary("xml2"),
                    .linkedLibrary("z"),
                ]),
        .executableTarget(
            name: "ffplay",
            dependencies: [
                "fftools",
                "SDL2",
            ]
        ),
        .executableTarget(
            name: "ffprobe",
            dependencies: [
                "fftools",
            ]
        ),
        .executableTarget(
            name: "ffmpeg",
            dependencies: [
                "fftools",
            ]
        ),
        .target(
            name: "fftools",
            dependencies: [
                "FFmpegKit",
            ]
        ),
        .systemLibrary(
            name: "SDL2",
            pkgConfig: "sdl2",
            providers: [
                .brew(["sdl2"]),
            ]
        ),
        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/MoltenVK.zip",
            checksum: "66d9f2d7d0aaeaf1a45b99fdd537f2914ce0dc0458179b0cdad8b302226a7873"
        ),
        .binaryTarget(
            name: "libshaderc_combined",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libshaderc_combined.zip",
            checksum: "22aa6c6f28c6b7302992303bb7c949819ad41bc998c421104c3667b0c6c6a1f0"
        ),
        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/lcms2.zip",
            checksum: "109205d540d7dd721b76b354281046d06a546fff5b5c83d3b57ce2409f52efc8"
        ),
        .binaryTarget(
            name: "libplacebo",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libplacebo.zip",
            checksum: "f5e24edf2a5075fb7ce09fc6dfb23c8a4a31e9b6d7eb82065321c48c415d3a2c"
        ),
        .binaryTarget(
            name: "libdav1d",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libdav1d.zip",
            checksum: "d06654bba260e80835416140262c010db80ff8b52eb0751a07088bb1d167ef17"
        ),
        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libavcodec.zip",
            checksum: "e7ea9ab8c1a048143b723c2104b6100933004df175501c74fe30024b42532681"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libavdevice.zip",
            checksum: "d55c1d0e9c76838fb3f757613009bd616546b38bcfd1b53c0c9e3199f991fa78"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libavfilter.zip",
            checksum: "1b01eb5a1f0949d6716b58686dd33b727c5f2b351ac3f6e7f146c1cf7fe0bbdf"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libavformat.zip",
            checksum: "8091d1875d079d0be88b90726c68ddeb3ebe8872bd930230699cad1bf14a4c8b"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libavutil.zip",
            checksum: "b41a2cb3d2f8ae0ed5340aead695cb7ef89837b62fa016629d60297e9e95f49b"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libswresample.zip",
            checksum: "189864b8fddf31206df4118e229ec568dce6080d7cc6d84dbf7d525f1e9d9965"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/Libswscale.zip",
            checksum: "cfc8a0f34cd9ffa847a8911366933f40759785c3cbfa216becc4e9a88dc2944b"
        ),
        .binaryTarget(
            name: "libsrt",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libsrt.zip",
            checksum: "c9bc7d20c7cd32d931c433d35748d75976021a30ff355fbb0b574baeb0292448"
        ),
        .binaryTarget(
            name: "libzvbi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libzvbi.zip",
            checksum: "df6673991d7466a0546094f3861fa9fa053cb4f656ec7ee1b47d0b093b5f8faa"
        ),
        .binaryTarget(
            name: "libfreetype",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libfreetype.zip",
            checksum: "f4ec8a2777831df193f949cb996f46dfd7193a478a4d53af8e47f6c5251bbfaa"
        ),
        .binaryTarget(
            name: "libfribidi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libfribidi.zip",
            checksum: "52e784ff8578ca976f5df83e2572a9cf2802b34b6105f61b5bee0777627295ee"
        ),
        .binaryTarget(
            name: "libharfbuzz",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libharfbuzz.zip",
            checksum: "27908aaaa3698f620f58556a46f68e7cc1d78f89e4a5faca82cfd9b9b317128a"
        ),
        .binaryTarget(
            name: "libass",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libass.zip",
            checksum: "23e43ea1b2d345b68dc3eb8d33230fee76dfe5c5371ff6640576afda07da2cfa"
        ),
        .binaryTarget(
            name: "libmpv",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libmpv.zip",
            checksum: "c4dd00403bfdd1a06604c43f42888c44b55cc4f6863da8bc592471af9690ce29"
        ),
        .binaryTarget(
            name: "gmp",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/gmp.zip",
            checksum: "944b8ae9ab2cfd418d16556c9df5f765b31f92eae42f77b4a7bd51ff44d93f7a"
        ),
        .binaryTarget(
            name: "nettle",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/nettle.zip",
            checksum: "1b16247e230315bf00d7ff9407cd68166585d632a6eb30a04f697a9b49d64e39"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/hogweed.zip",
            checksum: "a155ecead0c1c052d3ce480e441b6f530c679600398d2fb1bad67ddbc6007068"
        ),
        .binaryTarget(
            name: "libfontconfig",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libfontconfig.zip",
            checksum: "8bb826929241c800d09a3be1d12cfe1f80aa23af168d144652ed978f08680ec9"
        ),
        .binaryTarget(
            name: "libbluray",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libbluray.zip",
            checksum: "9ce0b4f0c85256d768e3fd1e99b5a498416522afd555d961777b998c118e92fc"
        ),
        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/gnutls.zip",
            checksum: "998c6a174093ef49c9d5f61febca09a5bb548b63218e2b82adb5b394fa0f1561"
        ),
        .binaryTarget(
            name: "libsmbclient",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libsmbclient.zip",
            checksum: "a73dd4c1223a14bf09776294e6259163dfdd979ee1141a7faf8f5d7bc9ff1568"
        ),
    ]
)
