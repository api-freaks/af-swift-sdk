import Foundation

extension Requests {
    public struct OcrPredictRequest: Codable, Hashable, Sendable {
        /// URL of the image or PDF (required if `file` not provided)
        public let url: String?
        /// OCR model to use. `mini-ocr-v1` for CAPTCHA OCR, `ocr-v1` for general OCR
        public let model: OcrPredictRequestModel
        /// Specify page range for multi-page PDFs (e.g., '1,3,5-10' or 'allpages'). **Note:** This parameter can only be used with .pdf file types.
        public let pageRange: String?
        /// Define OCR zones using coordinates (top:left:height:width). Multiple zones can be defined using commas. Only available for model 'ocr-v1'. **Note:** This parameter cannot be used with .pdf and .zip file types as it can only be applied to single image queries.
        public let zone: String?
        /// Set to 1 to split output text into individual lines (default: 0)
        public let newLine: Int?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            url: String? = nil,
            model: OcrPredictRequestModel,
            pageRange: String? = nil,
            zone: String? = nil,
            newLine: Int? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.url = url
            self.model = model
            self.pageRange = pageRange
            self.zone = zone
            self.newLine = newLine
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.model = try container.decode(OcrPredictRequestModel.self, forKey: .model)
            self.pageRange = try container.decodeIfPresent(String.self, forKey: .pageRange)
            self.zone = try container.decodeIfPresent(String.self, forKey: .zone)
            self.newLine = try container.decodeIfPresent(Int.self, forKey: .newLine)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.url, forKey: .url)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.pageRange, forKey: .pageRange)
            try container.encodeIfPresent(self.zone, forKey: .zone)
            try container.encodeIfPresent(self.newLine, forKey: .newLine)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case url
            case model
            case pageRange = "page_range"
            case zone
            case newLine = "new_line"
        }
    }
}