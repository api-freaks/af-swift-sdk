import Foundation

extension Requests {
    public struct OcrPredictRequest: Codable, Hashable, Sendable {
        /// URL of the image or PDF (required if `file` not provided)
        public let ocrPredictRequestUrl: String?
        /// OCR model to use. `mini-ocr-v1` for CAPTCHA OCR, `ocr-v1` for general OCR
        public let ocrPredictRequestModel: OcrPredictRequestModel
        /// Specify page range for multi-page PDFs (e.g., '1,3,5-10' or 'allpages'). **Note:** This parameter can only be used with .pdf file types.
        public let ocrPredictRequestPageRange: String?
        /// Define OCR zones using coordinates (top:left:height:width). Multiple zones can be defined using commas. Only available for model 'ocr-v1'. **Note:** This parameter cannot be used with .pdf and .zip file types as it can only be applied to single image queries.
        public let ocrPredictRequestZone: String?
        /// Set to 1 to split output text into individual lines (default: 0)
        public let ocrPredictRequestNewLine: Int?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            ocrPredictRequestUrl: String? = nil,
            ocrPredictRequestModel: OcrPredictRequestModel,
            ocrPredictRequestPageRange: String? = nil,
            ocrPredictRequestZone: String? = nil,
            ocrPredictRequestNewLine: Int? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.ocrPredictRequestUrl = ocrPredictRequestUrl
            self.ocrPredictRequestModel = ocrPredictRequestModel
            self.ocrPredictRequestPageRange = ocrPredictRequestPageRange
            self.ocrPredictRequestZone = ocrPredictRequestZone
            self.ocrPredictRequestNewLine = ocrPredictRequestNewLine
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.ocrPredictRequestUrl = try container.decodeIfPresent(String.self, forKey: .ocrPredictRequestUrl)
            self.ocrPredictRequestModel = try container.decode(OcrPredictRequestModel.self, forKey: .ocrPredictRequestModel)
            self.ocrPredictRequestPageRange = try container.decodeIfPresent(String.self, forKey: .ocrPredictRequestPageRange)
            self.ocrPredictRequestZone = try container.decodeIfPresent(String.self, forKey: .ocrPredictRequestZone)
            self.ocrPredictRequestNewLine = try container.decodeIfPresent(Int.self, forKey: .ocrPredictRequestNewLine)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.ocrPredictRequestUrl, forKey: .ocrPredictRequestUrl)
            try container.encode(self.ocrPredictRequestModel, forKey: .ocrPredictRequestModel)
            try container.encodeIfPresent(self.ocrPredictRequestPageRange, forKey: .ocrPredictRequestPageRange)
            try container.encodeIfPresent(self.ocrPredictRequestZone, forKey: .ocrPredictRequestZone)
            try container.encodeIfPresent(self.ocrPredictRequestNewLine, forKey: .ocrPredictRequestNewLine)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case ocrPredictRequestUrl = "url"
            case ocrPredictRequestModel = "model"
            case ocrPredictRequestPageRange = "page_range"
            case ocrPredictRequestZone = "zone"
            case ocrPredictRequestNewLine = "new_line"
        }
    }
}