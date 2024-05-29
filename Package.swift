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
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/MoltenVK.zip",
            checksum: "66c7100e12b339293609e4823f145a726344c6adceed04216e469f473e4cd152"
        ),
        .binaryTarget(
            name: "libshaderc_combined",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libshaderc_combined.zip",
            checksum: "1b0db2ec52e251661db6f64f239e53f82a73d3422b6b1bd70e041558ac0b8c17"
        ),
        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/lcms2.zip",
            checksum: "6b1a378d6fccc884f72dd52452d74cef6129d89d921c0fbcad8db11a467824ab"
        ),
        .binaryTarget(
            name: "libplacebo",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libplacebo.zip",
            checksum: "8565f8d2a6350dd866a5fe97fc0740103ef57868244ab1b27754c01787b10adf"
        ),
        .binaryTarget(
            name: "libdav1d",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libdav1d.zip",
            checksum: "ef936884a2769cb33fb25c198c51fbc58cc231dbd8a35102726d1660e8e23eaf"
        ),
        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libavcodec.zip",
            checksum: "119f2bbd6be4b24af586bd876546cf5d0b022762cd624dae6e53b8daecfc1daa"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libavdevice.zip",
            checksum: "d6a4670c64d26c667a625d3bd1a3086c3fff21ad38169cc901964139b3ade203"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libavfilter.zip",
            checksum: "fd4f97961347276b85a067853c62a372afdd67df74ba4f6314013fb416565405"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libavformat.zip",
            checksum: "6e43ebcb6d9ff4221c0772cb38cd861d425bae1ac790c06129ad97ec8201a2cf"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libavutil.zip",
            checksum: "408268826987bf810b8c0cf7e580dd09c69e9b9991c4a46c0ea26cfbef19fcd9"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libswresample.zip",
            checksum: "e44852b93f420698bf80305be00b1db26497f68561a9b1f051f0dea74f7819ba"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/Libswscale.zip",
            checksum: "3895d58cc586625df3ac3429abd7919bd0c2a2116b64508d3d77704edde33b84"
        ),
        .binaryTarget(
            name: "libsrt",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libsrt.zip",
            checksum: "6fe7f2376296ae848bde2ca12757060b45574971bb2df4dc037a546365c70d24"
        ),
        .binaryTarget(
            name: "libzvbi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libzvbi.zip",
            checksum: "529b3d25ace3767ce0208a00f34a73b2df33c5032d55cad3f9dcfe0d9da9f9f2"
        ),
        .binaryTarget(
            name: "libfreetype",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libfreetype.zip",
            checksum: "622fddbc0b57a15c9f8423f85bffc9ad7a13f48329f4155127f020b71058e6ad"
        ),
        .binaryTarget(
            name: "libfribidi",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libfribidi.zip",
            checksum: "9b5c3b1f171180c03212e51e4b42a32c2c0a006ad3061ff65a6f6f001c05b67e"
        ),
        .binaryTarget(
            name: "libharfbuzz",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libharfbuzz.zip",
            checksum: "e4a99532cd0e50ece35180a29208c011096af70cffe3626571b03557eb7aae7d"
        ),
        .binaryTarget(
            name: "libass",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libass.zip",
            checksum: "2f8ac74324530b166126112373647ddbb859990afb175f6074cb170a959407d5"
        ),
        .binaryTarget(
            name: "libmpv",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libmpv.zip",
            checksum: "5903ee7d2183cc5462bec8904e42bfffa717b5a1ccd95836f15a253f2ea0283a"
        ),
        .binaryTarget(
            name: "gmp",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/gmp.zip",
            checksum: "36e276dd93479437a6856a5bc4aee62068255e1d5b56a842e06098b1bd9ef63c"
        ),
        .binaryTarget(
            name: "nettle",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/nettle.zip",
            checksum: "2d455a1830394f7311eb094aaa738dfd943402f2f3606cad7f3b30964317aeca"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/hogweed.zip",
            checksum: "cd2e4315cdf7216e5018fa62503effaa7b77b1a7af3f7ddc7c26def649f8f1a9"
        ),
        .binaryTarget(
            name: "libfontconfig",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libfontconfig.zip",
            checksum: "ad7a02aab986fa0933c6855d1a5d5a0fb89d747e6a116547f994d3a03e5e833e"
        ),
        .binaryTarget(
            name: "libbluray",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libbluray.zip",
            checksum: "f21bf7d74a5f66df0db217c83d16f41eb4171a3d615a184870f2a0a26116511e"
        ),
        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/gnutls.zip",
            checksum: "de67eef623049645a4d2afe1f0b13cb76ecc577f6fb463c9b96e02e0ccc3ea09"
        ),
        .binaryTarget(
            name: "libsmbclient",
            url: "https://github.com/Tinuv-Dev/FFMPEGBuilder/releases/download/v1/libsmbclient.zip",
            checksum: "dd7a1cc0359fddd2bb9331c75dae88da5049b383954f100d41548fbab6578918"
        ),
    ]
)
