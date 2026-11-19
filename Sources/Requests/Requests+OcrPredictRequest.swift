import Foundation

extension Requests {
    public struct OcrPredictRequest {
        /// Image, PDF, or ZIP file for OCR (required if `url` not provided). Supported formats: .png, .jpg, .jpeg, .bmp, .tiff, .gif, .pcx, .pdf, .zip. **Note:** PDFs containing images in them are allowed only for processing. The request body must contain only this file; every other option is a query parameter.
        public let file: FormFile?

        public init(
            file: FormFile? = nil
        ) {
            self.file = file
        }
    }
}

extension Requests.OcrPredictRequest: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        file.map { [.file($0, fieldName: "file")] } ?? []
    }
}