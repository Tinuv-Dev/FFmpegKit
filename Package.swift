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
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libavcodec.zip",
            checksum: "cb97b63a44d16f437273abb058a9e28a9605f522beaca53865173cc7c8b8f7b9"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libavdevice.zip",
            checksum: "20216e6590602ec2948a8628be0e7132fc2240ba206a8b47ef3f8887afcc7a38"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libavfilter.zip",
            checksum: "424a5d9274d428dfced047078b40d6ab4f4c8f9e926d015498aa3f4c2bd0836f"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libavformat.zip",
            checksum: "e464fc163900f78e2bf17d68729f9529dd9270b347c2073d2ae9292c4d3987e9"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libavutil.zip",
            checksum: "e2e99a7e93a9251c5d84ae524976957c987804053095299cb1162c1752fcabfe"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libswresample.zip",
            checksum: "7d2db2f50849e07a000c443c59b081caf6f21ca7a3aece3144daa28f16876f43"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/Libswscale.zip",
            checksum: "a71c1a6cf4fdc296ab98086a481b002b3cf1008abb7d9241cfdb10e69be0251f"
        ),
        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/MoltenVK.zip",
            checksum: "2a9b4403e4f8242e470f0bbdb3a3a9b3ee0a0bec40789cc0edefe52ea77619e8"
        ),
        .binaryTarget(
            name: "gmp",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/gmp.zip",
            checksum: "f3d8aed44166d4891e1c32437c71b438d549c63cabc81f463543f866881989b9"
        ),
        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/gnutls.zip",
            checksum: "b53dd8c54662963bc43c1de03f689950636d3d222760ceb7ab84d3235a8799c8"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/hogweed.zip",
            checksum: "639dd5b4066e8fc509f2b8f7ec5e2d8e259d44bda640b764810d3e4d84854d77"
        ),
        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/lcms2.zip",
            checksum: "0a88f8fd3fcfde34bb4b0ae70c0c6ee1a955ded4d465205706b88e08c12daed5"
        ),
        .binaryTarget(
            name: "libass",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libass.zip",
            checksum: "0b3dd2c97a49a96a4f7a3e2dba2f0bfd24409658950cd01003cb7f8325b618f9"
        ),
        .binaryTarget(
            name: "libbluray",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libbluray.zip",
            checksum: "a50843dae34314b7c8ae369394c25040a8f1eacfcf32e06b83dcf930b95d2235"
        ),
        .binaryTarget(
            name: "libdav1d",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libdav1d.zip",
            checksum: "5dee083269415eb720c5fb4c3c011033085dca5e115ce368704be84657364fda"
        ),
        .binaryTarget(
            name: "libfontconfig",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libfontconfig.zip",
            checksum: "a39b53ecdcd46d59e626d1df75235e36b28a11c620c45a5e91828b39d4c4f981"
        ),
        .binaryTarget(
            name: "libfreetype",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libfreetype.zip",
            checksum: "fc1aebc9d12fa00f5731ebcc34dcec2bdb449baa5a80b067f5b2732519c2bc36"
        ),
        .binaryTarget(
            name: "libfribidi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libfribidi.zip",
            checksum: "3f58882174388ad594cb93a7f61b292bd2620e6e768bcd37a4f63cb1dcbf91af"
        ),
        .binaryTarget(
            name: "libharfbuzz",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libharfbuzz.zip",
            checksum: "3b131f35f3eb991576664680d15e486550fc785e17400e703e2b32518ccd20b1"
        ),
        .binaryTarget(
            name: "libmpv",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libmpv.zip",
            checksum: "0a4c63e169312111804cb398d902cccbe1c9d8b5181850cd38a259a0707594bb"
        ),
        .binaryTarget(
            name: "libplacebo",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libplacebo.zip",
            checksum: "4fa039d79c03c153ff35e0075d30632394ee1f75fa0b834f5829529e221825fe"
        ),
        .binaryTarget(
            name: "libshaderc_combined",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libshaderc_combined.zip",
            checksum: "a0bc84d0ca014527516c8f1721ff99cbbdccdf32ed67aad806a2222380c936e8"
        ),
        .binaryTarget(
            name: "libsmbclient",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libsmbclient.zip",
            checksum: "2494107d4654b295022e172b830b2195bf1be577a9df59f3f34df8b953918284"
        ),
        .binaryTarget(
            name: "libsrt",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libsrt.zip",
            checksum: "427f6b50c38caf3548d5fe1c1cbe7c8909d98a4a784b3de6f8570b82f806c3e5"
        ),
        .binaryTarget(
            name: "libzvbi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/libzvbi.zip",
            checksum: "bb453862ed72faa54fb2d9bc902645508fdb009aae57ae520f0e4418c82d2841"
        ),
        .binaryTarget(
            name: "nettle",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1.1/nettle.zip",
            checksum: "ce5389e0c5cd8d2d21bd6fbaa4fd2b5f671df61331ab6826d22d9439eb5a21c6"
        ),
    ]
)
