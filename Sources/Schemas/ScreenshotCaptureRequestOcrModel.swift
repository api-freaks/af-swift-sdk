import Foundation

public enum ScreenshotCaptureRequestOcrModel: String, Codable, Hashable, CaseIterable, Sendable {
    case miniOcrV1 = "mini-ocr-v1"
    case ocrV1 = "ocr-v1"
}