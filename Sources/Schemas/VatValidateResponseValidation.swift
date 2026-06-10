import Foundation

public struct VatValidateResponseValidation: Codable, Hashable, Sendable {
    public let isValid: Bool
    /// Returned when the upstream authority provides a consultation reference.
    public let consultationNumber: String?
    public let consultationAuthority: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        isValid: Bool,
        consultationNumber: String? = nil,
        consultationAuthority: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.isValid = isValid
        self.consultationNumber = consultationNumber
        self.consultationAuthority = consultationAuthority
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isValid = try container.decode(Bool.self, forKey: .isValid)
        self.consultationNumber = try container.decodeIfPresent(String.self, forKey: .consultationNumber)
        self.consultationAuthority = try container.decode(String.self, forKey: .consultationAuthority)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.isValid, forKey: .isValid)
        try container.encodeIfPresent(self.consultationNumber, forKey: .consultationNumber)
        try container.encode(self.consultationAuthority, forKey: .consultationAuthority)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case isValid = "is_valid"
        case consultationNumber = "consultation_number"
        case consultationAuthority = "consultation_authority"
    }
}