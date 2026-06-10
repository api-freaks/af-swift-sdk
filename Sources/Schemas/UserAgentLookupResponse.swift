import Foundation

public struct UserAgentLookupResponse: Codable, Hashable, Sendable {
    /// User-agent string that is parsed for browser, device and operating system details.
    public let userAgentString: String
    /// Agent name or the actual browser name that was used.
    public let name: String
    /// Agent type or the browser type that was used. Possible values:
    /// 1. Browser
    /// 2. Browser Webview
    /// 3. Mobile App
    /// 4. Robot Mobile
    /// 5. Cloud Application
    /// 6. Email Client
    /// 7. Voice
    /// 8. Special
    /// 9. Testclient
    /// 10. Hacker
    /// 11. Unknown
    public let type: String
    /// Agent version or the browser version
    public let version: String
    /// Agent version major or the browser version major
    public let versionMajor: String
    public let device: UserAgentLookupResponseDevice
    public let engine: UserAgentLookupResponseEngine
    public let operatingSystem: UserAgentLookupResponseOperatingSystem
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userAgentString: String,
        name: String,
        type: String,
        version: String,
        versionMajor: String,
        device: UserAgentLookupResponseDevice,
        engine: UserAgentLookupResponseEngine,
        operatingSystem: UserAgentLookupResponseOperatingSystem,
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
        self.userAgentString = try container.decode(String.self, forKey: .userAgentString)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.version = try container.decode(String.self, forKey: .version)
        self.versionMajor = try container.decode(String.self, forKey: .versionMajor)
        self.device = try container.decode(UserAgentLookupResponseDevice.self, forKey: .device)
        self.engine = try container.decode(UserAgentLookupResponseEngine.self, forKey: .engine)
        self.operatingSystem = try container.decode(UserAgentLookupResponseOperatingSystem.self, forKey: .operatingSystem)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.userAgentString, forKey: .userAgentString)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.versionMajor, forKey: .versionMajor)
        try container.encode(self.device, forKey: .device)
        try container.encode(self.engine, forKey: .engine)
        try container.encode(self.operatingSystem, forKey: .operatingSystem)
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