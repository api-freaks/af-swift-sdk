import Foundation

/// Object contains IBAN validation details.
public struct IbanValidateResponseValidation: Codable, Hashable, Sendable {
    /// Checks if provided IBAN contains only alpha numeric characters
    public let isAlphaNumeric: Bool
    /// Checks whether given IBAN country supports IBAN standards
    public let isIbanSupportedCountry: Bool
    /// Indicates whether IBAN length is according to respective country standard or not.
    public let isValidLength: Bool
    /// Indicates whether IBAN structure is valid as per structure pattern for respective country.
    public let isValidStructure: Bool
    /// Indicates whether IBAN check digit is valid.
    public let isIbanCheckDigitValid: Bool
    /// Indicates BBAN checksum is valid or invalid or not supported (unknown) for respective IBAN country.
    public let bban: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        isAlphaNumeric: Bool,
        isIbanSupportedCountry: Bool,
        isValidLength: Bool,
        isValidStructure: Bool,
        isIbanCheckDigitValid: Bool,
        bban: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.isAlphaNumeric = isAlphaNumeric
        self.isIbanSupportedCountry = isIbanSupportedCountry
        self.isValidLength = isValidLength
        self.isValidStructure = isValidStructure
        self.isIbanCheckDigitValid = isIbanCheckDigitValid
        self.bban = bban
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isAlphaNumeric = try container.decode(Bool.self, forKey: .isAlphaNumeric)
        self.isIbanSupportedCountry = try container.decode(Bool.self, forKey: .isIbanSupportedCountry)
        self.isValidLength = try container.decode(Bool.self, forKey: .isValidLength)
        self.isValidStructure = try container.decode(Bool.self, forKey: .isValidStructure)
        self.isIbanCheckDigitValid = try container.decode(Bool.self, forKey: .isIbanCheckDigitValid)
        self.bban = try container.decodeIfPresent(String.self, forKey: .bban)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.isAlphaNumeric, forKey: .isAlphaNumeric)
        try container.encode(self.isIbanSupportedCountry, forKey: .isIbanSupportedCountry)
        try container.encode(self.isValidLength, forKey: .isValidLength)
        try container.encode(self.isValidStructure, forKey: .isValidStructure)
        try container.encode(self.isIbanCheckDigitValid, forKey: .isIbanCheckDigitValid)
        try container.encodeIfPresent(self.bban, forKey: .bban)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case isAlphaNumeric = "is_alpha_numeric"
        case isIbanSupportedCountry = "is_iban_supported_country"
        case isValidLength = "is_valid_length"
        case isValidStructure = "is_valid_structure"
        case isIbanCheckDigitValid = "is_iban_check_digit_valid"
        case bban
    }
}