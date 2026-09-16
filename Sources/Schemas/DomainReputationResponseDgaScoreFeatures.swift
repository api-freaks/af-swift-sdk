import Foundation

/// Underlying lexical / statistical features used in DGA detection.
public struct DomainReputationResponseDgaScoreFeatures: Codable, Hashable, Sendable {
    /// Length of the domain name.
    public let domainLength: Int
    /// Ratio of vowels to consonants in the domain.
    public let vowelConsonantRatio: Float
    /// N-gram perplexity score of the domain string.
    public let ngramPerplexity: Float
    /// Shannon entropy of the domain string.
    public let shannonEntropy: Float
    /// Ratio of digits to letters in the domain.
    public let digitLetterRatio: Float
    /// Maximum consecutive consonant streak in the domain.
    public let consonantStreakMax: Int
    /// Indicates if the TLD belongs to a known DGA set.
    public let tldInKnownDgaSet: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainLength: Int,
        vowelConsonantRatio: Float,
        ngramPerplexity: Float,
        shannonEntropy: Float,
        digitLetterRatio: Float,
        consonantStreakMax: Int,
        tldInKnownDgaSet: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainLength = domainLength
        self.vowelConsonantRatio = vowelConsonantRatio
        self.ngramPerplexity = ngramPerplexity
        self.shannonEntropy = shannonEntropy
        self.digitLetterRatio = digitLetterRatio
        self.consonantStreakMax = consonantStreakMax
        self.tldInKnownDgaSet = tldInKnownDgaSet
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainLength = try container.decode(Int.self, forKey: .domainLength)
        self.vowelConsonantRatio = try container.decode(Float.self, forKey: .vowelConsonantRatio)
        self.ngramPerplexity = try container.decode(Float.self, forKey: .ngramPerplexity)
        self.shannonEntropy = try container.decode(Float.self, forKey: .shannonEntropy)
        self.digitLetterRatio = try container.decode(Float.self, forKey: .digitLetterRatio)
        self.consonantStreakMax = try container.decode(Int.self, forKey: .consonantStreakMax)
        self.tldInKnownDgaSet = try container.decode(Bool.self, forKey: .tldInKnownDgaSet)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.domainLength, forKey: .domainLength)
        try container.encode(self.vowelConsonantRatio, forKey: .vowelConsonantRatio)
        try container.encode(self.ngramPerplexity, forKey: .ngramPerplexity)
        try container.encode(self.shannonEntropy, forKey: .shannonEntropy)
        try container.encode(self.digitLetterRatio, forKey: .digitLetterRatio)
        try container.encode(self.consonantStreakMax, forKey: .consonantStreakMax)
        try container.encode(self.tldInKnownDgaSet, forKey: .tldInKnownDgaSet)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainLength = "domain_length"
        case vowelConsonantRatio = "vowel_consonant_ratio"
        case ngramPerplexity = "ngram_perplexity"
        case shannonEntropy = "shannon_entropy"
        case digitLetterRatio = "digit_letter_ratio"
        case consonantStreakMax = "consonant_streak_max"
        case tldInKnownDgaSet = "tld_in_known_dga_set"
    }
}