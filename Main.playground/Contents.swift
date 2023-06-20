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
    private var array: [T]
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
class Queue<T>{
    private var array: [T]
    init(){
        self.array = []
    }
    func add(_ newElement: T){
        array.append(newElement)
    }
    func remove(){
        guard array.count > 0 else{
            return
        }
        array.removeFirst()
    }
    func peek() -> T?{
        guard array.count > 0 else{
            return nil
        }
        return array.first
    }
    func isEmpty() -> Bool{
        if array.count > 0 {
            return false
        }
        return true
    }
}
var stack: Stack = Stack<Node>()
var queue: Queue = Queue<Node>()
print("Here are all objects")
for _ in 0..<5{
    var node = Node()
    print(node.id)
    stack.push(node)
    queue.add(node)
}
print("The stack Output: \n")
while !stack.isEmpty(){
    if let x = stack.peek(){
        print(x.id)
    }
    stack.pop()
}
print("The Queue Output: \n")
while !queue.isEmpty(){
    if let element = queue.peek(){
        print(element.id)
    }
    queue.remove()
}

