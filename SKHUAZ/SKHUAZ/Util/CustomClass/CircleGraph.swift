//
//  CircleGraph.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/04.
//

import UIKit

class CircleGraphView: UIView {
    
    var numbers: [Int] = [] {
        didSet {
            updateProgressValues()
        }
    }
    
    private var progressValues: [CGFloat] = []
    var lineWidth: CGFloat = 10.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - lineWidth / 2
        
        var startAngle = CGFloat(-Double.pi / 2)
        
        for (index, progress) in progressValues.enumerated() {
            let endAngle = startAngle + progress * CGFloat(Double.pi * 2)
            
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius,
                                    startAngle:startAngle,
                                    endAngle:endAngle,
                                    clockwise:true)
            
            let colorIndex = index % 4
            let strokeColor = colorForIndex(colorIndex)
            
            context.setLineWidth(lineWidth)
            context.setStrokeColor(strokeColor.cgColor)

            context.addPath(path.cgPath)
            context.strokePath()

            startAngle += progress * CGFloat(Double.pi * 2)
       }
   }

   private func colorForIndex(_ index:Int) -> UIColor {
       switch index {
       case 0:
           return UIColor(hex: "#EFEFEF")
       case 1:
           return UIColor(hex: "#FFB6B6")
       case 2:
           return UIColor(hex: "#FFE2E2")
       case 3:
           return UIColor(hex: "#E98383")
       default:
           return .clear
      }
   }
   
   private func updateProgressValues() {
       guard !numbers.isEmpty else { // 빈 배열이면 종료합니다.
           progressValues.removeAll()
           setNeedsDisplay()
           return
       }
       
       let total = numbers.reduce(0, +)
       progressValues = numbers.map { CGFloat($0) / CGFloat(total) }
       
       setNeedsDisplay()
   }
}
