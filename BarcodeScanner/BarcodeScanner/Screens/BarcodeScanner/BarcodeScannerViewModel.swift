import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode: String?
    @Published var alertItem: AlertItem?
    
    var scannedBarcodeStatus: String {
        scannedCode ?? "Not Scanned Yet"
    }
    
    var scanStatusColor: Color {
        scannedCode == nil ? .red : .green
    }
}
