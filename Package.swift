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
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libavcodec.zip",
            checksum: "6c3dbe18b3457dafe1d1b41353f638c1c88540620c7a8477f3e0acba7b5b985a"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libavdevice.zip",
            checksum: "91ba7834fb6017bcfee84d3e3491860554738b5d669aa6c52aab80e0ce351135"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libavfilter.zip",
            checksum: "98d4a760026d2af1341d2507fcdc65e68fb87d7850c45b1f2be425f89b83578d"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libavformat.zip",
            checksum: "4eabe83ce82722b51e6af1d2cf1737080f36e1db833df6946c9b6f9a7fde0443"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libavutil.zip",
            checksum: "c123d69a275ae656bcb032cfde840e9ec9d86d2d9f691e7d032d6ca3219604cd"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libswresample.zip",
            checksum: "a421ea51e24ff9325d7cf05cf7c08e4b9765f7d1d657d05b672b0ac0b581f33e"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/Libswscale.zip",
            checksum: "97b260b8929273ebfba844f5a3b49e084262a4a77703d3a51bccd7d57d9c9387"
        ),
        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/MoltenVK.zip",
            checksum: "341112b3b757845bda0d465f05aef0e192679cd35b7c2fa2861c4b3b82dff5af"
        ),
        .binaryTarget(
            name: "gmp",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/gmp.zip",
            checksum: "303926e5d547186f586030fecff855f5092f229ef438f093c3541cd1787139d9"
        ),
        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/gnutls.zip",
            checksum: "7f73183474ee249c427097c2a75d023954cefc86f4b86f99c6a874ee0514bcd0"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/hogweed.zip",
            checksum: "31bb17e25587857de43d334b3333696b252c5902345156fb13cfd6ca853fed53"
        ),
        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/lcms2.zip",
            checksum: "99e315a72b8697f18d65540785c64cdd6739a5851bd923c8d787ef0bb5ed99ac"
        ),
        .binaryTarget(
            name: "libass",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libass.zip",
            checksum: "3af55f06d218e1459afb5e93e5d741bfc44e916752c127384beec53852c2b95c"
        ),
        .binaryTarget(
            name: "libbluray",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libbluray.zip",
            checksum: "0cc55843b2b55757e87743a6e7b1ff28cbe0f15174378c40132d56e6e48a2e25"
        ),
        .binaryTarget(
            name: "libdav1d",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libdav1d.zip",
            checksum: "450bb862215daafad90e31147b79a48d342b76959bbf995936b7ec95a9ca8acd"
        ),
        .binaryTarget(
            name: "libfontconfig",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libfontconfig.zip",
            checksum: "5be1964cb6ce83d86c2de9107aaace7b9dc2be847738a2683e3950038cffa918"
        ),
        .binaryTarget(
            name: "libfreetype",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libfreetype.zip",
            checksum: "1dd31640a3d4288a1e46291ba7e49d74fe241f7a3233c42148ba6542e3fd40c5"
        ),
        .binaryTarget(
            name: "libfribidi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libfribidi.zip",
            checksum: "20429bd4796471e102930132ebbcc7bd24b7a16471266d320f157f784c85dc53"
        ),
        .binaryTarget(
            name: "libharfbuzz",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libharfbuzz.zip",
            checksum: "cfaccc1973a50f9137ca70c5fb42d279590b442029b77202db4c909a54ad9c53"
        ),
        .binaryTarget(
            name: "libmpv",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libmpv.zip",
            checksum: "ce3d0f5ab96073f74180f2f95a1ee4cb537ba7ca0c0d661d05741b785b76c9dd"
        ),
        .binaryTarget(
            name: "libplacebo",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libplacebo.zip",
            checksum: "8467bac7131bfb1a94c7c1a6f4745068820cf6144799da58cfd73d70dfccfa40"
        ),
        .binaryTarget(
            name: "libshaderc_combined",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libshaderc_combined.zip",
            checksum: "d2852a10783e1527ec0f8336b283c7ee520d63c4bcefa8dd078b87347eccf201"
        ),
        .binaryTarget(
            name: "libsmbclient",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libsmbclient.zip",
            checksum: "750c68189eb5a5b327c6c6832fe9b199b0610c73bf2b760ebadfb3b272023bdb"
        ),
        .binaryTarget(
            name: "libsrt",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libsrt.zip",
            checksum: "7b23658453b5ed7e21c1dd49ce67e6bb87230c549f8e9c9094d28b33884e62cd"
        ),
        .binaryTarget(
            name: "libzvbi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/libzvbi.zip",
            checksum: "0de2fdecd74cfe5273d43f279c72888437df428678eb2884599993511b5a3bf6"
        ),
        .binaryTarget(
            name: "nettle",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/1.1.2/nettle.zip",
            checksum: "e57eea4b9000cfddf49ac899826b365e60afafe0f5e5d54c1896f23d1abb25c0"
        ),
    ]
)
