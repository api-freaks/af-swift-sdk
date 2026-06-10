import Foundation

public struct EmailValidateResponseAddress: Codable, Hashable, Sendable {
    public let security: EmailValidateResponseAddressSecurity?
    public let location: EmailValidateResponseAddressLocation?
    public let validIpAddress: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        security: EmailValidateResponseAddressSecurity? = nil,
        location: EmailValidateResponseAddressLocation? = nil,
        validIpAddress: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.security = security
        self.location = location
        self.validIpAddress = validIpAddress
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.security = try container.decodeIfPresent(EmailValidateResponseAddressSecurity.self, forKey: .security)
        self.location = try container.decodeIfPresent(EmailValidateResponseAddressLocation.self, forKey: .location)
        self.validIpAddress = try container.decodeIfPresent(Bool.self, forKey: .validIpAddress)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.security, forKey: .security)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.validIpAddress, forKey: .validIpAddress)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case security
        case location
        case validIpAddress
    }
}