import Foundation

public enum OcrPredictRequestModel: String, Codable, Hashable, CaseIterable, Sendable {
    case miniOcrV1 = "mini-ocr-v1"
    case ocrV1 = "ocr-v1"
}