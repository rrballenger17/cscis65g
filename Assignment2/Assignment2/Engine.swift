//
//  Engine.swift
//  Assignment2
//
//  Created by Ryan Ballenger on 7/5/16.
//  Copyright © 2016 ios. All rights reserved.
//

import Foundation

class Engine{
    

    func wrap(position: Int)-> Int{
        
        var coord = position
        
        if coord < 0 {
            coord = coord + 10
        }
        
        if coord > 9 {
            coord = coord - 10
        }
        
        return coord
    }
    
    // count all true's to the left
    func leftNeighbors(board: Array<Array<Bool>>, x: Int, y: Int)-> Int{
        
        var sum = 0
        
        var leftX = x-1
        
        leftX = wrap(leftX)
        
        for var newY in [y-1, y, y+1]{
            
            newY = wrap(newY)
            
            sum = sum + Int(board[leftX][newY])
        }
        
        return sum
    }
    
    // count all true's to the right
    func rightNeighbors(board: Array<Array<Bool>>, x: Int, y: Int)-> Int{
        
        var sum = 0
        
        var rightX = x+1
        
        rightX = wrap(rightX)
        
        for var newY in [y-1, y, y+1]{
            
            newY = wrap(newY)
            
            sum = sum + Int(board[rightX][newY])
        }
        
        return sum
    }
    
    // count all true's above and below the spot
    func verticalNeighbors(board: Array<Array<Bool>>, x: Int, y: Int)-> Int{
        
        var below = y - 1
        
        below = wrap(below)
        
        var above = y + 1
        
        above = wrap(above)
        
        var sum = Int(board[x][below])
        
        sum = sum + Int(board[x][above])
        
        return sum
        
    }
    
    
    
    
    func makeBoolArray(board: Array<Array<Bool>>)->Array<Array<Bool>>{
        
        var holder = Array<Array<Bool>>()
        
        for _ in 0...board.count - 1{
            
            var newBool = Array<Bool>()
            
            for _ in 0...9{
                newBool.append(false)
            }
            
            holder.append(newBool)
        }
        
        return holder
    }
    
    
    
    // count neighbors containing true in all directions with wrapping
    func countNeighbors(board: Array<Array<Bool>>, x: Int, y: Int)-> Int{
        
        var sum = 0
        sum = sum + leftNeighbors(board, x: x, y: y)
        sum = sum + rightNeighbors(board, x: x, y: y)
        sum = sum + verticalNeighbors(board, x: x, y: y)
        
        return sum
    }
    
    
    func step(board: Array<Array<Bool>>)->Array<Array<Bool>>{
        
        var secondArray = makeBoolArray(board)
        
        for x in 0...9{
            for y in 0...9{
                
                let neighs = countNeighbors(board, x: x, y: y)
                
                let current = board[x][y]
                
                switch (current, neighs) {
                
                // alive and 2 or 3 neighbors lives
                case (true, 2..<4):
                    secondArray[x][y] = true
                
                // dead and exactly 3 neighbors lives
                case (false, 3):
                    secondArray[x][y] = true
                
                // all else is set to false
                default:
                    secondArray[x][y] = false
                }
                
            }
        }
        
        return secondArray
        
        
        
    }
    
    
    func countNeighborsAll(board: Array<Array<Bool>>)-> Array<Array<Int>>{
        var neighbors = makeIntArray(board)
        
        // for all spots on the board
        for x in 0...9{
            for y in 0...9{
                let count = countNeighbors(board, x: x, y: y)
                neighbors[x][y] = count
                
            }
        }
        
        return neighbors
    }
    
    func makeIntArray(board: Array<Array<Bool>>)->Array<Array<Int>>{
        
        var holder = Array<Array<Int>>()
        
        for _ in 0...board.count - 1{
            
            var newInt = Array<Int>()
            
            for _ in 0...9{
                newInt.append(-1)
            }
            
            holder.append(newInt)
        }
        
        return holder
    }
    
    
    // an initializer if the class changes in the future and a variable needs initiated
    init(){}
    
}









