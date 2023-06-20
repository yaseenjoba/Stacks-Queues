//
//  Stack.swift
//  StacksAndQueues
//
//  Created by Yassen Joba on 20/06/2023.
//


import Foundation
class Stack<T>{
    var array: [T]
    init(){
        self.array = []
    }
    func pop(){
        guard array.count > 0 else{
            return
        }
        array.removeLast()
    }
    func push(newElement: T){
        array.append(newElement)
    }
    func peek() -> T? {
        guard array.count > 0 else{
            return nil
        }
        return array.last
    }
    func isEmpty() -> Bool{
        if array.count > 0 {
            return false
        }
        return true
    }
}


