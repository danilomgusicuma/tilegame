//
//  ContentView.swift
//  TileGame
//
//  Created by Danilo Miranda Gusicuma on 20/01/22.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    var pieces = [SKSpriteNode]()
    var currentNode: SKNode?
    
    override func sceneDidLoad() {
        for _ in 0...5 {
            let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
            pieces.append(box)
        }
        for i in 1...pieces.count - 1 {
            
            pieces[i].position = CGPoint(x: CGFloat( i * 70), y: CGFloat(60))
            addChild(pieces[i])
        }
        
        
    }
    override func didMove(to view: SKView) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                self.currentNode = node
                print(self.currentNode?.position)
            }
        }
        
    }
}
    
    struct SpriteKitContainer: View {
        
        var scene: SKScene {
            let scene = GameScene()
            scene.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            scene.scaleMode = .fill
            return scene
        }
        
        var body: some View {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    SpriteView(scene: scene)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
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


