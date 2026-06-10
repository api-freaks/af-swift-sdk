import Foundation

public struct VatValidateResponse: Codable, Hashable, Sendable {
    public let countryCode: String
    public let vatNumber: String
    public let requesterCountryCode: String?
    public let requesterVatNumber: String?
    public let requestedAt: Date
    public let validation: VatValidateResponseValidation
    public let company: VatValidateResponseCompany
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        countryCode: String,
        vatNumber: String,
        requesterCountryCode: String? = nil,
        requesterVatNumber: String? = nil,
        requestedAt: Date,
        validation: VatValidateResponseValidation,
        company: VatValidateResponseCompany,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.countryCode = countryCode
        self.vatNumber = vatNumber
        self.requesterCountryCode = requesterCountryCode
        self.requesterVatNumber = requesterVatNumber
        self.requestedAt = requestedAt
        self.validation = validation
        self.company = company
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.vatNumber = try container.decode(String.self, forKey: .vatNumber)
        self.requesterCountryCode = try container.decodeIfPresent(String.self, forKey: .requesterCountryCode)
        self.requesterVatNumber = try container.decodeIfPresent(String.self, forKey: .requesterVatNumber)
        self.requestedAt = try container.decode(Date.self, forKey: .requestedAt)
        self.validation = try container.decode(VatValidateResponseValidation.self, forKey: .validation)
        self.company = try container.decode(VatValidateResponseCompany.self, forKey: .company)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.vatNumber, forKey: .vatNumber)
        try container.encodeIfPresent(self.requesterCountryCode, forKey: .requesterCountryCode)
        try container.encodeIfPresent(self.requesterVatNumber, forKey: .requesterVatNumber)
        try container.encode(self.requestedAt, forKey: .requestedAt)
        try container.encode(self.validation, forKey: .validation)
        try container.encode(self.company, forKey: .company)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case countryCode = "country_code"
        case vatNumber = "vat_number"
        case requesterCountryCode = "requester_country_code"
        case requesterVatNumber = "requester_vat_number"
        case requestedAt = "requested_at"
        case validation
        case company
    }
}