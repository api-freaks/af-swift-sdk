import Foundation

public struct BulkUserAgentLookupResponseItemOperatingSystem: Codable, Hashable, Sendable {
    /// Operating system name or the base software name that runs on the hardware.
    public let name: String
    /// Operating system type. Possible values:
    /// 1. Desktop
    /// 2. Mobile
    /// 3. Game Console
    /// 4. Embedded
    /// 5. Cloud
    /// 6. Hacker
    /// 7. Anonymized
    /// 8. Unknown
    public let type: String
    /// Operating system version
    public let version: String
    /// Operating system version major
    public let versionMajor: String
    /// Operating system build
    public let build: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: String,
        version: String,
        versionMajor: String,
        build: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.version = version
        self.versionMajor = versionMajor
        self.build = build
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.version = try container.decode(String.self, forKey: .version)
        self.versionMajor = try container.decode(String.self, forKey: .versionMajor)
        self.build = try container.decode(String.self, forKey: .build)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.versionMajor, forKey: .versionMajor)
        try container.encode(self.build, forKey: .build)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case version
        case versionMajor = "version_major"
        case build
    }
}