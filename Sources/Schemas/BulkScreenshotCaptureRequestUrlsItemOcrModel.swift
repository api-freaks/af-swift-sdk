import Foundation

/// Recognition model used by the captcha solver: mini-ocr-v1 (default) or ocr-v1.
public enum BulkScreenshotCaptureRequestUrlsItemOcrModel: String, Codable, Hashable, CaseIterable, Sendable {
    case miniOcrV1 = "mini-ocr-v1"
    case ocrV1 = "ocr-v1"
}