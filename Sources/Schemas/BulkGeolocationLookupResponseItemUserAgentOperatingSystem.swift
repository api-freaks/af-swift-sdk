import Foundation

public struct BulkGeolocationLookupResponseItemUserAgentOperatingSystem: Codable, Hashable, Sendable {
    public let name: String?
    public let type: String?
    public let version: String?
    public let versionMajor: String?
    public let build: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        type: String? = nil,
        version: String? = nil,
        versionMajor: String? = nil,
        build: String? = nil,
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
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
        self.versionMajor = try container.decodeIfPresent(String.self, forKey: .versionMajor)
        self.build = try container.decodeIfPresent(String.self, forKey: .build)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.versionMajor, forKey: .versionMajor)
        try container.encodeIfPresent(self.build, forKey: .build)
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