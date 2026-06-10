import Foundation

public struct UserAgentLookupResponseEngine: Codable, Hashable, Sendable {
    /// Layout engine name or the underlying core that converts the HTML into visual
    public let name: String
    /// Layout engine type. Possible values:
    /// 1. Browser
    /// 2. Mobile App
    /// 3. Hacker
    /// 4. Robot
    /// 5. Unknown
    public let type: String
    /// Layout engine version
    public let version: String
    /// Layout engine version major
    public let versionMajor: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: String,
        version: String,
        versionMajor: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.version = version
        self.versionMajor = versionMajor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.version = try container.decode(String.self, forKey: .version)
        self.versionMajor = try container.decode(String.self, forKey: .versionMajor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.versionMajor, forKey: .versionMajor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case version
        case versionMajor = "version_major"
    }
}