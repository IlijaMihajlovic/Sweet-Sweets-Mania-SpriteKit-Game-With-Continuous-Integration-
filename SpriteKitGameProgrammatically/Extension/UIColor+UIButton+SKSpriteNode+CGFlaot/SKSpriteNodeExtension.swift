//
//  SKSpriteNodeExtension.swift
//  Sweet Sweets Mania
//
//  Created by Ilija Mihajlovic on 5/14/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    
    func scaleTo(screenWidthPercentage: CGFloat) {
        let aspectRatio = self.size.height / self.size.width
        self.size.width = ScreenSize.width * screenWidthPercentage
        self.size.height = self.size.width * aspectRatio
    }
    
    func scaleTo(screenHeightPercentage: CGFloat) {
        let aspectRatio = self.size.width / self.size.height
        self.size.height = ScreenSize.heigth * screenHeightPercentage
        self.size.width = self.size.height * aspectRatio
    }
    
    func popUp(after: CGFloat = 0.0, sequenceNumber: Int = 1) {
        let action2Duration = 0.2
        let action3Duration = 0.06
        let action4Duration = 0.1
        let action5Duration = 0.05
        let totalTimeOfPopUpAnimation = action2Duration + action3Duration + action4Duration + action5Duration
        let action0 = SKAction.scale(to: 0.0, duration: 0.0)
        let action1 = SKAction.wait(forDuration: TimeInterval(CGFloat(sequenceNumber) * CGFloat(totalTimeOfPopUpAnimation) + after))
        let action2 = SKAction.scale(to: 1.1, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.05, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action0, action1, action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func popDown(after: CGFloat = 0.0, sequenceNumber: Int = 1) {
        let action2Duration = 0.1
        let action3Duration = 0.03
        let action4Duration = 0.05
        let action5Duration = 0.02
        let totalTimeOfPopUpAnimation = action2Duration + action3Duration + action4Duration + action5Duration
        let action0 = SKAction.scale(to: 1.0, duration: 0.0)
        let action1 = SKAction.wait(forDuration: TimeInterval(CGFloat(sequenceNumber) * CGFloat(totalTimeOfPopUpAnimation) + after))
        let action2 = SKAction.scale(to: 1.9, duration: action2Duration)
        let action3 = SKAction.scale(to: 1.7, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.85, duration: action4Duration)
        let action5 = SKAction.scale(to: 0.0, duration: action5Duration)
        let sequence = SKAction.sequence([action0, action1, action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func bounce() {
        let action2Duration = 0.3
        let action3Duration = 0.12
        let action4Duration = 0.2
        let action5Duration = 0.1
        let action2 = SKAction.scale(to: 1.2, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.1, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func bounceLockedButton() {
        let action2Duration = 0.15
        let action3Duration = 0.06
        let action4Duration = 0.1
        let action5Duration = 0.05
        let action2 = SKAction.scale(to: 1.2, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.1, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func bounceCookie() {
        let action2Duration = 0.3
        let action3Duration = 0.12
        let action4Duration = 0.2
        let action5Duration = 0.1
        let action2 = SKAction.scale(to: 1.6, duration: action2Duration)
        let action3 = SKAction.scale(to: 0.95, duration: action3Duration)
        let action4 = SKAction.scale(to: 1.3, duration: action4Duration)
        let action5 = SKAction.scale(to: 1.0, duration: action5Duration)
        let sequence = SKAction.sequence([action2, action3, action4, action5])
        self.run(sequence)
    }
    
    func rotate(speed: Int, clockWise: Bool) {
        let angel = clockWise ? CGFloat(-.pi/2.0) : CGFloat(.pi/2.0)
        let rotateForever = SKAction.repeatForever(SKAction.rotate(byAngle: angel, duration: TimeInterval(speed)))
        self.run(rotateForever)
    }
    
    func swing(speed: Int, startClockWise: Bool, angle: CGFloat) {
        let swingRight = SKAction.rotate(toAngle: .pi/angle, duration: TimeInterval(speed))
        let swingLeft = SKAction.rotate(toAngle: -.pi/angle, duration: TimeInterval(speed))
        let sequence = startClockWise ? SKAction.sequence([swingRight, swingLeft]) : SKAction.sequence([swingLeft, swingRight])
        let swingForever = SKAction.repeatForever(sequence)
        self.run(swingForever)
    }
    
    func slide(speed: Int, distanceX: CGFloat, distanceY: CGFloat) {
        let slide = SKAction.moveBy(x: distanceX , y: distanceY, duration: TimeInterval(speed))
        let slideBack = SKAction.moveBy(x: -distanceX , y: -distanceY, duration: TimeInterval(speed))
        let slideLeftRight = SKAction.sequence([slide, slideBack])
        let slideForever = SKAction.repeatForever(slideLeftRight)
        self.run(slideForever)
    }
    
    func fadeUp() {
        let randomWait = SKAction.wait(forDuration: TimeInterval(CGFloat.random(0.0, max: 0.2)))
        let growAction = SKAction.scale(to: CGFloat.random(3.0, max: 5.0), duration: TimeInterval(CGFloat.random(1.0, max: 1.5)))
        let fadeOutAction = SKAction.fadeOut(withDuration: TimeInterval(CGFloat.random(1.0, max: 1.5)))
        let group = SKAction.group([growAction, fadeOutAction])
        self.run(SKAction.sequence([randomWait, group]))
    }
}
