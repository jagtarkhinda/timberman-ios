//
//  GameScene.swift
//  SushiTower
//
//  Created by Parrot on 2019-02-14.
//  Copyright © 2019 Parrot. All rights reserved.
//


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let cat = SKSpriteNode(imageNamed: "character1")
    let sushiBase = SKSpriteNode(imageNamed:"roll")
    
    var tower:[SKSpriteNode]  = []
    
    
    
    
    override func didMove(to view: SKView) {
        // add background
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = -1
        addChild(background)
        
        // add cat
        cat.position = CGPoint(x:self.size.width*0.25, y:100)
        addChild(cat)
        
        // add base sushi pieces
        sushiBase.position = CGPoint(x:self.size.width*0.5, y: 100)
        addChild(sushiBase)
        
        
        for i in 0...5 {
            spawnSushi()
        }
        
        
    }
    
    
    func spawnSushi() {
        
        // 1. check how many pieces are in teh tower
        let numPieces = self.tower.count
        
        // if 0 pieces, put piece at the starting position
        let specialSushi = SKSpriteNode(imageNamed:"roll")
        
        if (numPieces  == 0) {
            // add sushi at starting position
            specialSushi.position = CGPoint(x:self.size.width*0.5, y: 200)
        }
        else if (numPieces > 0) {
            // 1. get the previous piece
            let previousPiece = self.tower[self.tower.count-1]
            
            // 2. add the new pieces at 50 pixel above it
            specialSushi.position = CGPoint(
                x:self.size.width*0.5,
                y:previousPiece.position.y + 100)
        }
        
        
        let rightStick = SKSpriteNode(imageNamed: "chopstick")
        rightStick.position.x = 80;
        rightStick.xScale = -1
        
        let leftStick = SKSpriteNode(imageNamed:"chopstick")
        leftStick.position.x = -80
        
        // add sticks to sushi
        specialSushi.addChild(leftStick)
        specialSushi.addChild(rightStick)
        
        // add sushi to the screen
        addChild(specialSushi)
        
        // add the sushi to the tower
        tower.append(specialSushi)
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        //specialSushi.position.y = specialSushi.position.y - 10
        //chopstick.position.y = chopstick.position.y - 10
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // This is the shortcut way of saying:
        //      let mousePosition = touches.first?.location
        //      if (mousePosition == nil) { return }
        guard let mousePosition = touches.first?.location(in: self) else {
            return
        }
        
        print(mousePosition)
        
        let CENTER = self.size.width / 2
        if (mousePosition.x < CENTER) {
            // left
            // - move cat to x = 25% of width
            cat.position = CGPoint(x:self.size.width*0.25, y:100)
            
            let leftHandUpAction = SKAction.scaleX(to: 1, duration: 0)
            self.cat.run(leftHandUpAction)
        }
        else {
            // right
            // - move cat to x = 80% of width
            cat.position = CGPoint(x:self.size.width*0.80, y:100)
            let rightHandUpAction = SKAction.scaleX(to: -1, duration: 0)
            self.cat.run(rightHandUpAction)
        }
        
        
    }
    
}
