//
//  Stack.swift
//  StacksAndQueues
//
//  Created by Yassen Joba on 20/06/2023.
//
import Foundation

class Node: Hashable, Equatable , Comparable{
    var id: Int
    var description: String
    init(){
        self.id = Int.random(in: 0..<200)
        self.description = "this is a description for \(self.id)"
    }
    static func == (lhs: Node, rhs: Node) -> Bool {
        if lhs.id == rhs.id && lhs.description == rhs.description{
            return true
        }
        return false
    }
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
           hasher.combine(description)
    }
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.id < rhs.id
    }
    
}
class ExtraOperations<T: Hashable & Comparable>{
    internal var array: [T] = []
    var maxCapacity: Int?
    init(){}
    required init(_ maxCapacity:Int){}
    private func mergeSort(array: inout [T], startIndex: Int, endIndex: Int) {
        // Base case
        if startIndex >= endIndex {
            return
        }
        
        let middleIndex = (startIndex + endIndex) / 2
        mergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
        mergeSort(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
        merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
    }
    private func merge(array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
        let leftSubarray = Array(array[startIndex...middleIndex])
        let rightSubarray = Array(array[middleIndex+1...endIndex])
        
        var index = startIndex
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
            if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
                array[index] = leftSubarray[leftIndex]
                leftIndex += 1
            }
            else {
                array[index] = rightSubarray[rightIndex]
                rightIndex += 1
            }
            index += 1
        }
        
        while leftIndex < leftSubarray.count {
            array[index] = leftSubarray[leftIndex]
            index += 1
            leftIndex += 1
        }
        
        while rightIndex < rightSubarray.count {
            array[index] = rightSubarray[rightIndex]
            index += 1
            rightIndex += 1
        }
    }
    func sort(){
        if array.isEmpty{
            return
        }
        mergeSort(array: &array, startIndex: 0, endIndex: array.count - 1)
    }
    func removeDuplicate(){
        var counter: [T: Bool] = [:]
        var newArray: [T] = []
        for i in 0..<array.count{
            if counter[array[i]] != nil{
                continue
            }else{
                counter[array[i]] = true
                newArray.append(array[i])
            }
        }
        array = newArray
    }
    func insertAtTndex(value num: T, at index: Int){
        array.insert(num, at: index)
    }
    func removeAtTndex(at index: Int){
        array.remove(at: index)
    }
    func resize(_ newCapacity: Int){
        
    }
}
class Stack<T: Hashable & Comparable>: ExtraOperations<T>{
    internal override var array: [T]{
        didSet{}
    }
    override var maxCapacity: Int?{
        didSet{}
    }
    override init(){
        super.init()
        self.array = []
    }
    required init(_ maxCapacity: Int) {
        super.init()
        self.maxCapacity = maxCapacity
    }
    func pop(){
        guard array.count > 0 else{
            return
        }
        array.removeLast()
    }
    func push(_ newElement: T){
        if let cap = maxCapacity, cap >= array.count {
            array.append(newElement)
        } else if maxCapacity == nil {
            array.append(newElement)
        }
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
class Queue<T: Hashable & Comparable>: ExtraOperations<T>{
    internal override var array: [T]{
        didSet{}
    }
    override var maxCapacity: Int?{
        didSet{}
    }
    override init(){
        super.init()
        self.array = []
    }
    required init(_ maxCapacity: Int) {
        super.init()
        self.maxCapacity = maxCapacity
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

print("Testing the extra ops")
var testSortingStackWithCapacity: Stack = Stack<Node>(10)
print("pushing 100 elements to stack with size 10")
for _ in 0..<100{
    var node = Node()
    testSortingStackWithCapacity.push(node)
}
print("The stack Output: \n")
while !testSortingStackWithCapacity.isEmpty(){
    if let x = testSortingStackWithCapacity.peek(){
        print(x.id)
    }
    testSortingStackWithCapacity.pop()
}
