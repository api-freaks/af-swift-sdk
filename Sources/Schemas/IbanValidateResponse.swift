import Foundation

public struct IbanValidateResponse: Codable, Hashable, Sendable {
    /// Determines whether IBAN passes all validation checks
    public let valid: Bool
    /// The IBAN number provided by the user.
    public let iban: String
    /// Object contains IBAN validation details.
    public let validation: IbanValidateResponseValidation
    /// Object contains Bank and BIC details.
    public let bankData: IbanValidateResponseBankData
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        valid: Bool,
        iban: String,
        validation: IbanValidateResponseValidation,
        bankData: IbanValidateResponseBankData,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.valid = valid
        self.iban = iban
        self.validation = validation
        self.bankData = bankData
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.valid = try container.decode(Bool.self, forKey: .valid)
        self.iban = try container.decode(String.self, forKey: .iban)
        self.validation = try container.decode(IbanValidateResponseValidation.self, forKey: .validation)
        self.bankData = try container.decode(IbanValidateResponseBankData.self, forKey: .bankData)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.valid, forKey: .valid)
        try container.encode(self.iban, forKey: .iban)
        try container.encode(self.validation, forKey: .validation)
        try container.encode(self.bankData, forKey: .bankData)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case valid
        case iban
        case validation
        case bankData = "bank_data"
    }
}