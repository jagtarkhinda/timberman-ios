//
//  Sushi.swift
//  SushiTower
//
//  Created by MacStudent on 2019-06-17.
//  Copyright © 2019 Parrot. All rights reserved.
//


import Foundation
import SpriteKit

class Sushi: SKSpriteNode {
    
    
    var leftStick:SKSpriteNode!
    var rightStick:SKSpriteNode!
    var roll:SKSpriteNode!
    
    var stickPosition:StickPosition = .none
    
    
    // Required function for SKSpriteNode class
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    // Nonsense code required for SKSpriteNode class
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func connectChopsticks() {
        leftStick = SKSpriteNode(imageNamed:"chopstick")
        rightStick = SKSpriteNode(imageNamed:"chopstick")
        rightStick.xScale = -1
        
        leftStick.position.x = self.size.width * -1
        leftStick.position.y = 0
        
        rightStick.position.x = self.size.width
        rightStick.position.y = 0
        addChild(leftStick)
        addChild(rightStick)
        
    }
    func updateStickImage() {
        if (stickPosition == StickPosition.none) {
            self.leftStick.isHidden = true
            self.rightStick.isHidden = true
        }
        else if (stickPosition == StickPosition.left) {
            self.leftStick.isHidden = false
            self.rightStick.isHidden = true
        }
        else if (stickPosition == StickPosition.right) {
            self.leftStick.isHidden = true
            self.rightStick.isHidden = false
        }
    }
    
    // make an enumeration object to represent which side the chopstick is on
    enum StickPosition {
        case right
        case left
        case none
    }
    
    
}
