//
//  ScrollIndicator.swift
//  customScrollIndicator
//
//  Created by Yasin Ilker Mehder (Dogus Teknoloji) on 28.01.2020.
//  Copyright © 2020 Yasin Ilker Mehder (Dogus Teknoloji). All rights reserved.
//
import UIKit

protocol ScrollIndicatorApi {
    var itemAmount: Int { get set }
    func scrollForItem(index: Int)
}

final class ScrollIndicator: UIView, ScrollIndicatorApi {
    
    var indicatorWidth: CGFloat = 70
    var indicatorHeight: CGFloat = 5
    var currentIndex: Int = 0
    var itemAmount: Int = 2
    var viewIndicatorPoint: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func scrollForItem(index: Int) {
        guard let viewIndicatorPoint = self.viewIndicatorPoint else { return }
        self.currentIndex = index
        let frameWidth = self.frame.width - indicatorWidth
        let intervalWidth = frameWidth / CGFloat(self.itemAmount-1)
        let indicatorPointX = intervalWidth * CGFloat(index)
        
        let isTherePlaceToScroll = frameWidth >= indicatorPointX
        
        guard isTherePlaceToScroll else { return }
        
        UIView.animate(withDuration: 1.0, animations: {
            viewIndicatorPoint.frame = CGRect(
                x: indicatorPointX,
                y: viewIndicatorPoint.frame.origin.y,
                width: self.indicatorWidth,
                height: self.indicatorHeight)
        })
    }
    
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 3.5
        let viewIndicatorPoint = UIView(
            frame: CGRect(
                x: 0,
                y: (self.frame.height/2) - (self.indicatorHeight/2),
                width: self.indicatorWidth,
                height: self.indicatorHeight)
        )
        
        viewIndicatorPoint.layer.cornerRadius = 3.5
        viewIndicatorPoint.backgroundColor = .black
        self.addSubview(viewIndicatorPoint)
        self.viewIndicatorPoint = viewIndicatorPoint
    }
}
