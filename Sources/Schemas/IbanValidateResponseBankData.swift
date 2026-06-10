import Foundation

/// Object contains Bank and BIC details.
public struct IbanValidateResponseBankData: Codable, Hashable, Sendable {
    /// SWIFT/BIC code extracted from IBAN for some countries.
    public let bic: String?
    /// Bank name extracted from IBAN for some countries.
    public let bank: String?
    /// Bank code extracted from IBAN for some countries.
    public let bankCode: String?
    /// Branch code extracted from IBAN for some countries.
    public let branchCode: String?
    /// Country name extracted from IBAN.
    public let country: String
    /// Alpha-2 standard country code extracted from IBAN.
    public let countryIso2: String
    /// City / branch name for respective bank extracted from IBAN for some countries.
    public let city: String?
    /// Bank branch address extracted from IBAN
    public let address: String?
    /// Account number extracted from IBAN
    public let account: String?
    /// Indicates whether given IBAN country supports Single Euro Payments Area (SEPA)
    public let sepa: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bic: String? = nil,
        bank: String? = nil,
        bankCode: String? = nil,
        branchCode: String? = nil,
        country: String,
        countryIso2: String,
        city: String? = nil,
        address: String? = nil,
        account: String? = nil,
        sepa: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bic = bic
        self.bank = bank
        self.bankCode = bankCode
        self.branchCode = branchCode
        self.country = country
        self.countryIso2 = countryIso2
        self.city = city
        self.address = address
        self.account = account
        self.sepa = sepa
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bic = try container.decodeIfPresent(String.self, forKey: .bic)
        self.bank = try container.decodeIfPresent(String.self, forKey: .bank)
        self.bankCode = try container.decodeIfPresent(String.self, forKey: .bankCode)
        self.branchCode = try container.decodeIfPresent(String.self, forKey: .branchCode)
        self.country = try container.decode(String.self, forKey: .country)
        self.countryIso2 = try container.decode(String.self, forKey: .countryIso2)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.account = try container.decodeIfPresent(String.self, forKey: .account)
        self.sepa = try container.decode(Bool.self, forKey: .sepa)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.bic, forKey: .bic)
        try container.encodeIfPresent(self.bank, forKey: .bank)
        try container.encodeIfPresent(self.bankCode, forKey: .bankCode)
        try container.encodeIfPresent(self.branchCode, forKey: .branchCode)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.countryIso2, forKey: .countryIso2)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.account, forKey: .account)
        try container.encode(self.sepa, forKey: .sepa)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bic
        case bank
        case bankCode = "bank_code"
        case branchCode = "branch_code"
        case country
        case countryIso2 = "country_iso2"
        case city
        case address
        case account
        case sepa
    }
}