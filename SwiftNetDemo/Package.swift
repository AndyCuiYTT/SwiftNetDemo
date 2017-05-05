import PackageDescription

let package = Package(
    name: "SwiftNetDemo",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        //MySql数据库依赖包
        .Package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", majorVersion: 2, minor: 0)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

