import Foundation

/// OCR model to use. `mini-ocr-v1` for CAPTCHA OCR, `ocr-v1` for general OCR
public enum OcrPredictRequestModel: String, Codable, Hashable, CaseIterable, Sendable {
    case miniOcrV1 = "mini-ocr-v1"
    case ocrV1 = "ocr-v1"
}