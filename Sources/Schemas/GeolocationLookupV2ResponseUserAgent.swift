import Foundation

/// Parsed User-Agent details from the request.
public struct GeolocationLookupV2ResponseUserAgent: Codable, Hashable, Sendable {
    /// Raw User-Agent string used for parsing.
    public let userAgentString: String?
    /// Detected user agent product name.
    public let name: String?
    /// User agent category (e.g., Browser, Mobile App, Bot).
    public let type: String?
    /// Full product version string.
    public let version: String?
    /// Major version extracted from version.
    public let versionMajor: String?
    /// Device details.
    public let device: GeolocationLookupV2ResponseUserAgentDevice?
    /// Rendering engine details.
    public let engine: GeolocationLookupV2ResponseUserAgentEngine?
    /// Operating system details.
    public let operatingSystem: GeolocationLookupV2ResponseUserAgentOperatingSystem?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userAgentString: String? = nil,
        name: String? = nil,
        type: String? = nil,
        version: String? = nil,
        versionMajor: String? = nil,
        device: GeolocationLookupV2ResponseUserAgentDevice? = nil,
        engine: GeolocationLookupV2ResponseUserAgentEngine? = nil,
        operatingSystem: GeolocationLookupV2ResponseUserAgentOperatingSystem? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.userAgentString = userAgentString
        self.name = name
        self.type = type
        self.version = version
        self.versionMajor = versionMajor
        self.device = device
        self.engine = engine
        self.operatingSystem = operatingSystem
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userAgentString = try container.decodeIfPresent(String.self, forKey: .userAgentString)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
        self.versionMajor = try container.decodeIfPresent(String.self, forKey: .versionMajor)
        self.device = try container.decodeIfPresent(GeolocationLookupV2ResponseUserAgentDevice.self, forKey: .device)
        self.engine = try container.decodeIfPresent(GeolocationLookupV2ResponseUserAgentEngine.self, forKey: .engine)
        self.operatingSystem = try container.decodeIfPresent(GeolocationLookupV2ResponseUserAgentOperatingSystem.self, forKey: .operatingSystem)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.userAgentString, forKey: .userAgentString)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.versionMajor, forKey: .versionMajor)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encodeIfPresent(self.engine, forKey: .engine)
        try container.encodeIfPresent(self.operatingSystem, forKey: .operatingSystem)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case userAgentString = "user_agent_string"
        case name
        case type
        case version
        case versionMajor = "version_major"
        case device
        case engine
        case operatingSystem = "operating_system"
    }
}