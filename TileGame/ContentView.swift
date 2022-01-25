//
//  ContentView.swift
//  TileGame
//
//  Created by Danilo Miranda Gusicuma on 20/01/22.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    var formBins = [SKSpriteNode]()
    var piecesBins = [SKSpriteNode]()
    var pieces = [SKSpriteNode]()
    var currentNode: SKNode?
    
    override func sceneDidLoad() {
        var slot = SKSpriteNode(color: .gray, size: CGSize(width: 100, height: 100))
        
        formBins.append(slot)
        formBins[0].position = CGPoint(x: CGFloat( UIScreen.main.bounds.size.width/2 - 55), y: CGFloat(UIScreen.main.bounds.size.height/2 + 120))
        formBins[0].name = "formSlot"
        addChild(formBins[0])
        
        
        slot = SKSpriteNode(color: .gray, size: CGSize(width: 100, height: 100))
        formBins.append(slot)
        formBins[1].position = CGPoint(x: CGFloat( UIScreen.main.bounds.size.width/2 + 55), y: CGFloat(UIScreen.main.bounds.size.height/2 + 120))
        formBins[1].name = "formSlot"
        addChild(formBins[1])
        
        slot = SKSpriteNode(color: .gray, size: CGSize(width: 100, height: 100))
        formBins.append(slot)
        formBins[2].position = CGPoint(x: CGFloat( UIScreen.main.bounds.size.width/2 - 55), y: CGFloat(UIScreen.main.bounds.size.height/2 + 10))
        formBins[2].name = "formSlot"
        addChild(formBins[2])
        
        slot = SKSpriteNode(color: .gray, size: CGSize(width: 100, height: 100))
        formBins.append(slot)
        formBins[3].position = CGPoint(x: CGFloat( UIScreen.main.bounds.size.width/2 + 55), y: CGFloat(UIScreen.main.bounds.size.height/2 + 10))
        formBins[3].name = "formSlot"
        addChild(formBins[3])

        
        for i in 0...5 {
            var box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
            
            
            piecesBins.append(box)
            piecesBins[i].position = CGPoint(x: CGFloat( i * 55 + 55), y: CGFloat(60))
            piecesBins[i].name = "initialSlot" + String(i)
            
            box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
            pieces.append(box)
            pieces[i].position = CGPoint(x: CGFloat( i * 55 + 55), y: CGFloat(60))
            pieces[i].name = "piece" + String(i)
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
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.currentNode?.name?.contains("piece") != nil{
            if formBins[0].frame.contains(self.currentNode?.position ?? CGPoint(x: 0, y: 0)){
                print("alou1")
            }else if formBins[1].frame.contains(self.currentNode?.position ?? CGPoint(x: 0, y: 0)){
                print("alou2")
            }else if formBins[2].frame.contains(self.currentNode?.position ?? CGPoint(x: 0, y: 0)){
                print("alou3")
            }else if formBins[3].frame.contains(self.currentNode?.position ?? CGPoint(x: 0, y: 0)){
                print("alou4")
            }
        }
    }
    
    func returnPieces(){
        for piece in pieces {
            
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


