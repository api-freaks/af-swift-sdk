import Foundation

/// Registrar's abuse-reporting contact.
public struct DomainWhoisLookupV2ResponseAbuseContact: Codable, Hashable, Sendable {
    /// Name of the abuse contact at the registrar.
    public let registrarName: String?
    /// Abuse contact email.
    public let emailAddress: String?
    /// Abuse contact phone.
    public let phoneNumber: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        registrarName: String? = nil,
        emailAddress: String? = nil,
        phoneNumber: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.registrarName = registrarName
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.registrarName = try container.decodeIfPresent(String.self, forKey: .registrarName)
        self.emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.registrarName, forKey: .registrarName)
        try container.encodeIfPresent(self.emailAddress, forKey: .emailAddress)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case registrarName = "registrar_name"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
    }
}