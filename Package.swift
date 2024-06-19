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
                    .linkedFramework("CoreAudioTypes"),
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
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/MoltenVK.zip",
            checksum: "bdd9dc8784ecadc2f18b0479bc3e7188f3d818ed8cf1a2d86ee389e282a23012"
        ),
        .binaryTarget(
            name: "libshaderc_combined",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libshaderc_combined.zip",
            checksum: "3045e4d6830ad95df1247ba1144f0bf0ba117d5cb35ff94dca8addd173786005"
        ),
        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/lcms2.zip",
            checksum: "bdf6766c934465f7671e543b28dbeb4a4cae77474259df0acd721c6635154ea5"
        ),
        .binaryTarget(
            name: "libplacebo",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libplacebo.zip",
            checksum: "21d76ec0a73e38309f1cc7733a2a9219e805231010c4d01242b570d8337a9f1d"
        ),
        .binaryTarget(
            name: "libdav1d",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libdav1d.zip",
            checksum: "df95401042f462a6d9fd155797eb0900009d9af985846ed11ed0cd18b8d8f480"
        ),
        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libavcodec.zip",
            checksum: "a28e1dbbaf72023bd409a5400f72017a303e97022dee1006a702d5026281691f"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libavdevice.zip",
            checksum: "0004a6d912c61247607c061b6695e049423e9eed484fc5ec804c4578e5f472aa"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libavfilter.zip",
            checksum: "d5058479b293819c3be69a06cb5935b120655875a2f30fbf5e04be0882fc1b35"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libavformat.zip",
            checksum: "bade665b94e4b22729b76e1cf3c6e84b8f2fafac6dffb97e08a63354b7a77f99"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libavutil.zip",
            checksum: "fdf5a9057db7e0d85d6923b2b0c85ab19e3a45db3a806cac2ccb6a8d4c88764e"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libswresample.zip",
            checksum: "04e4f67ccadf710d63604cae089b82ccfab553585c87fc26b2c0736a3ecbdeb2"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/Libswscale.zip",
            checksum: "e8a5d5ab3bbfd221a152a5c9c09212d0e1232ecfd47b18ff6b7d2a8a7f596e50"
        ),
        .binaryTarget(
            name: "libsrt",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libsrt.zip",
            checksum: "a3b25f5636eed277ae1884012985b26e2cae0561131a1241f2fe590d79127004"
        ),
        .binaryTarget(
            name: "libzvbi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libzvbi.zip",
            checksum: "56721567f70b3cf77004052d9a5ebbdaa70b57fab7a9754e3f23e16b68da0eb6"
        ),
        .binaryTarget(
            name: "libfreetype",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libfreetype.zip",
            checksum: "0ee2053cdf739127dd14bfd3a6cbdcc5f9b803704ee21f2fe7872577def9a3f5"
        ),
        .binaryTarget(
            name: "libfribidi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libfribidi.zip",
            checksum: "442d4767e40ceb7d1db411f4d4ff16b739730ed6bd71eda84957f5109145e868"
        ),
        .binaryTarget(
            name: "libharfbuzz",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libharfbuzz.zip",
            checksum: "386836dbe856b09d68d95222b6931a90c092f4d36b4373eaa2d7af36bfb4036d"
        ),
        .binaryTarget(
            name: "libass",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/pub/libass.zip",
            checksum: "23e43ea1b2d345b68dc3eb8d33230fee76dfe5c5371ff6640576afda07da2cfa"
        ),
        .binaryTarget(
            name: "libmpv",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libmpv.zip",
            checksum: "b3dc8188cafbf2d71c3b5a47452c2e128c47825edfe64fb49012a43532c5f576"
        ),
        .binaryTarget(
            name: "gmp",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/gmp.zip",
            checksum: "ffd300f6d129b37d596870fc471d735a9f88be34693a73ea068cd34b4599d940"
        ),
        .binaryTarget(
            name: "nettle",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/nettle.zip",
            checksum: "e6ba67024a8a4fd9ef52409242762c5019796b8ffbe1ac6bed24c46919f0a656"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/hogweed.zip",
            checksum: "48ea66aa129e4b64a3037ed56889f9f5cae30ea9c74285d49fdf1649c6eab2eb"
        ),
        .binaryTarget(
            name: "libfontconfig",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libfontconfig.zip",
            checksum: "53e986f71c022db944812715aeef8a759d400333208ed8cc23a05e4ec434ef01"
        ),
        .binaryTarget(
            name: "libbluray",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libbluray.zip",
            checksum: "7bcd241a12a74497c445dffee8dbddaa61f7caa9b61f82f707ba92cdfa3ac563"
        ),
        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/gnutls.zip",
            checksum: "8b9c029c86f96df59c4f025062e6bb82444a38d760a2128433c2e0df0ba08c50"
        ),
        .binaryTarget(
            name: "libsmbclient",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.3/libsmbclient.zip",
            checksum: "db1ba6517adfd1ca128bffaff2c3729492237255e8c7fcc7e732e85754b76e67"
        ),
    ]
)
