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
        
        let specialSushi = SKSpriteNode(imageNamed: "roll")
         specialSushi.position = CGPoint(x:self.size.width*0.5, y: 500)
        addChild(specialSushi)
        
        let chop = SKSpriteNode(imageNamed: "chopstick")
        chop.position.x = -100
        //adding child to another object (now the position will be relative to the parent object
        specialSushi.addChild(chop)
        
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // This is the shortcut way of saying:
        //      let mousePosition = touches.first?.location
        //      if (mousePosition == nil) { return }
        guard let mousePosition = touches.first?.location(in: self) else {
            return
        }
        
        print(mousePosition)
        
        
        let CENTER = self.size.width/2
        
        if(mousePosition.x < CENTER)
        {
            //if right side
            //write the code to position the cat at 80%
            cat.position = CGPoint(x:self.size.width*0.25, y:100)
           // flipping cat
            let leftHand = SKAction.scaleX(to: 1, duration: 0)
            self.cat.run(leftHand)
        }
        else{
            
            //if left side
            //write the code to position the cat at 25%
             cat.position = CGPoint(x:self.size.width*0.80, y:100)
            //flipping cat
            let leftHand = SKAction.scaleX(to: -1, duration: 0)
            self.cat.run(leftHand)
        }
    }
    
}
