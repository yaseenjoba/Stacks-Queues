//
//  Stack.swift
//  StacksAndQueues
//
//  Created by Yassen Joba on 20/06/2023.
//
import Foundation

class Node{
    var id: UUID
    var description: String
    init(){
        self.id = UUID()
        self.description = "this is a description for \(self.id)"
    }
}

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
    func push(_ newElement: T){
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

var stack: Stack = Stack<Node>()
print("Here are all objects")
for _ in 0..<5{
    var node = Node()
    print(node.id)
    stack.push(node)
}
print("The stack Output: \n")
while !stack.isEmpty(){
    if let x = stack.peek(){
        print(x.id)
    }
    stack.pop()
}


