import Foundation

extension Requests {
    public struct PdfUploadResourcesRequest {
        /// The PDF files to be uploaded to the API Freaks server. Multiple files can be provided in an array.
        public let file: [FormFile]

        public init(
            file: [FormFile]
        ) {
            self.file = file
        }
    }
}

extension Requests.PdfUploadResourcesRequest: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        [
            .fileArray(file, fieldName: "file")
        ]
    }
}