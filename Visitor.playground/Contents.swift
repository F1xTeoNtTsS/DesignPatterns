class TextDocument: Visitable {
    var title: String
    var body: String = ""
    var numbersOfPage: Int = 1
    
    init(title: String) {
        self.title = title
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(textDocument: self)
    }
}

class SpredsheetDocument: Visitable {
    var title: String
    var body: [[String]] = [[]]
    var numberOfRows: Int = 1
    var numberOfColumns: Int = 1
    
    init(title: String) {
        self.title = title
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(spredsheetDocument: self)
    }
}

protocol Visitor {
    func visit(textDocument: TextDocument)
    func visit(spredsheetDocument: SpredsheetDocument)
}

protocol Visitable {
    func accept(visitor: Visitor)
}

class EpubExporter: Visitor {
    func visit(textDocument: TextDocument) {
        print("Export text document \(textDocument.title) to Epub")
    }
    
    func visit(spredsheetDocument: SpredsheetDocument) {
        print("Export spredsheet document \(spredsheetDocument.title) to Epub")
    }
}

class PDFExporter: Visitor {
    func visit(textDocument: TextDocument) {
        print("Export text document \(textDocument.title) to PDF")
    }
    
    func visit(spredsheetDocument: SpredsheetDocument) {
        print("Export spredsheet document \(spredsheetDocument.title) to PDF")
    }
}

let text1 = TextDocument(title: "Report")
let text2 = TextDocument(title: "Act 23")

let sheet1 = SpredsheetDocument(title: "Bills")
let sheet2 = SpredsheetDocument(title: "Customers")
let sheet3 = SpredsheetDocument(title: "Providers")

let documents: [Visitable] = [text1, text2, sheet1, sheet2, sheet3]

let epubExporter = EpubExporter()
let pdfExporter = PDFExporter()

documents.forEach { $0.accept(visitor: epubExporter) }
documents.forEach { $0.accept(visitor: pdfExporter) }

