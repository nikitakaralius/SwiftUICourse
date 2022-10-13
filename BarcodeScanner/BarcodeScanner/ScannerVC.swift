import UIKit
import AVFoundation

enum CameraError: String {
    case invalidDeviceInput     = "Something is wrong with the camera. We are unable to capture the input."
    case invalidScannedValue    = "The value scanned is not valid. This app scans EAN-8 and EAN-13."
}

protocol ScannerVCDelegate: AnyObject {
    func didFindBarcode(barcode: String)
    func didSurface(error: CameraError)
}

final class ScannerVC: UIViewController {
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupCaptureSession() {
        receiveVideoInput()
        scanForBarcodes()
        addVideoPreview()
        captureSession.startRunning()
    }
    
    private func receiveVideoInput() {
        guard let videoInput = receiveVideoCaptureDeviceInput() else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
    }
    
    private func receiveVideoCaptureDeviceInput() -> AVCaptureDeviceInput? {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return nil }
        return try? AVCaptureDeviceInput(device: videoCaptureDevice)
    }
    
    private func scanForBarcodes() {
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
    }
    
    private func addVideoPreview() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
    }
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first,
              let machineReadableObject = object as? AVMetadataMachineReadableCodeObject,
              let barcode = machineReadableObject.stringValue
        else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        scannerDelegate?.didFindBarcode(barcode: barcode)
    }
}
