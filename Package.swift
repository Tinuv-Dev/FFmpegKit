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
            name: "Libavcodec",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libavcodec.zip",
            checksum: "b8249dd619384b5d1bdc99f4dacfdcef802cb2e7a827f31e4b6ddfedf5e61f6c"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libavdevice.zip",
            checksum: "17703ca8b988d7a6a85a221b2c1c3f13a48aaa5b578089a215913b29b084ce49"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libavfilter.zip",
            checksum: "47ba829dbfb9ee3900ca00f288de71a32178f88ca7021cf6e46ff16eda3a528e"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libavformat.zip",
            checksum: "b027a013f6d66d528d41d4ff168d9607e5ca63f0203e27236395747dd4a47c08"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libavutil.zip",
            checksum: "5555b546261974201e019cacc3e7db529df5d5b70b21560882dfefaf7a7bcd8b"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libswresample.zip",
            checksum: "789ef723030841e4bae044408b89ffa277ffeb6b2a1210dd157175af3d771da6"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.4/Libswscale.zip",
            checksum: "064df31dc273173590a9ea8bd78a1aa380e02faadb817cfc88e7f7a0c19ec974"
        ),
        .binaryTarget(
            name: "libass",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libass.zip",
            checksum: "23e43ea1b2d345b68dc3eb8d33230fee76dfe5c5371ff6640576afda07da2cfa"
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
