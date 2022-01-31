//
//  ContentView.swift
//  TileGame
//
//  Created by Danilo Miranda Gusicuma on 20/01/22.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    var spriteRotating: SKSpriteNode = SKSpriteNode(imageNamed: "mascote")
    
    override func sceneDidLoad() {
        spriteRotating.position = CGPoint(x: frame.midX + 150, y: frame.midY + 200)
        spriteRotating.size.height = 100
        spriteRotating.size.width = 100 * (356/474)
        addChild(spriteRotating)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spriteRotating.run(SKAction.rotate(byAngle: -CGFloat.pi/2.0, duration: 0.5))
    }
    

}

struct SpriteKitContainer: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                SpriteView(scene: scene)
                    .frame(width: geometry.size.width, height: (4/3) * geometry.size.width)
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteKitContainer()
    }
}
