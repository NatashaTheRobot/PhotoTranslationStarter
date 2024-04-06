//
//  ImageExtensions.swift
//  PhotoTranslator
//
//  Created by Natasha Murashev on 4/6/24.
//

import UIKit
import SwiftUI

extension UIImage {
    
    func clippedToSquare() -> UIImage? {
        let originalWidth = size.width
        let originalHeight = size.height
        let cropSize = min(originalWidth, originalHeight)
        
        let cropRect = CGRect(x: (originalWidth - cropSize) / 2,
                              y: (originalHeight - cropSize) / 2,
                              width: cropSize,
                              height: cropSize)
        
        // Perform cropping in a graphics context
        UIGraphicsBeginImageContextWithOptions(CGSize(width: cropSize, height: cropSize), false, scale)
        defer { UIGraphicsEndImageContext() }
        
        if let context = UIGraphicsGetCurrentContext() {
            context.translateBy(x: -cropRect.origin.x, y: -cropRect.origin.y)
            draw(at: CGPoint.zero)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        
        return nil
    }
    
    func resized(withTargetSize targetSize: CGSize, maintainAspectRatio: Bool = true) -> UIImage? {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if maintainAspectRatio {
            let ratio = min(widthRatio, heightRatio)
            newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        } else {
            newSize = targetSize
        }
        
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        Path(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.width))
    }
}
