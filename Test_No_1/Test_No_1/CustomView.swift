//
//  ViewClass.swift
//  Test_No_1
//
//  Created by varun.polanki on 5/1/18.
//  Copyright © 2018 varun.polanki. All rights reserved.
//

import UIKit
@IBDesignable
class CustomView: UIView {
    
    
    @IBInspectable var cornerRadius:CGFloat = 10.0
    @IBInspectable var viewColor:UIColor = UIColor.red
    @IBInspectable var image1:UIImage?  {
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var image2:UIImage? {
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var image1LabelText:String?
    @IBInspectable var image2LabelText:String?
    
    @IBInspectable var innerRadius:CGFloat = 20 {
        didSet{
            
            if self.innerRadius > 40 {
                self.innerRadius = 40
            }else if self.innerRadius < 5{
                self.innerRadius = 5
            }
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.makeTheView()
        self.setImageView()
    }
    
    func setImageView() {
        
        if self.image1 != nil{
            
            let imageView1 = UIImageView(frame: CGRect(x: self.bounds.midX - (0.8*(self.bounds.width/2))/2, y: 0.1*(self.bounds.height/2), width: 0.8*(self.bounds.width/2), height: 0.8*(self.bounds.height/2)))
            imageView1.contentMode = .scaleAspectFit
            imageView1.image = self.image1
            self.addSubview(imageView1)
            
            if self.image1LabelText != nil{
                let img1Lbl = UILabel(frame: CGRect(x: self.bounds.midX - (0.5*(self.bounds.width/2))/2, y: 0.02*(self.bounds.height/2) + imageView1.frame.size.height, width: 0.8*(self.bounds.width/2), height: 0.1*(self.bounds.height/2)))
                img1Lbl.text = self.image1LabelText
               
                self.addSubview(img1Lbl)
                
            }
        }
        
        if self.image2 != nil{
            let imageView2 = UIImageView(frame: CGRect(x: self.bounds.midX - (0.8*(self.bounds.width/2))/2, y: 1.0*(self.bounds.height/2), width: 0.8*(self.bounds.width/2), height: 0.8*(self.bounds.height/2)))
            imageView2.contentMode = .scaleAspectFit
            imageView2.image = self.image2
            self.addSubview(imageView2)
            
            if self.image1LabelText != nil{
                let img2Lbl = UILabel(frame: CGRect(x: self.bounds.midX - (0.9*(self.bounds.width/2))/2, y: 0.6*(self.bounds.height/2) + imageView2.frame.size.height , width: 1.2*(self.bounds.width/2), height: 0.8*(self.bounds.height/2)))
                img2Lbl.text = self.image2LabelText
                self.addSubview(img2Lbl)
                
            }
        }
    }
    
    func makeTheView(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.midY-60))
        let center = CGPoint(x: 0, y: self.bounds.midY)
        path.addArc(withCenter: center, radius: self.innerRadius, startAngle: 2*(CGFloat.pi)/3, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: self.bounds.maxY))
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.maxY))
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.midY+self.innerRadius))
        let center2 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
        path.addArc(withCenter: center2, radius: self.innerRadius, startAngle: (CGFloat.pi)/2, endAngle: CGFloat.pi/3, clockwise: true)
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: 0))
        path.close()
        viewColor.setFill()
        path.fill()
        let dotttedPath = UIBezierPath()
        let  p0 = CGPoint(x: self.innerRadius, y: self.bounds.midY)
        dotttedPath.move(to: p0)
        let  p1 = CGPoint(x: self.bounds.maxX - self.innerRadius, y: self.bounds.midY)
        dotttedPath.addLine(to: p1)
        let dashes :[CGFloat] = [ 5.0, 5.0 ]
        dotttedPath.setLineDash(dashes, count: dashes.count, phase: 0.0)
        dotttedPath.lineWidth = 2.0
        dotttedPath.lineCapStyle = .butt
        UIColor.gray.setStroke()
        dotttedPath.stroke()
        
    }
}

