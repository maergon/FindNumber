//
//  Game.swift
//  FindNumber
//
//  Created by Марсель Фаткуллин on 24.02.2022.
//

import Foundation

enum StatusGame{
    case start
    case win
}

class Game {
    struct Item {
        var title:String
        var isFound:Bool = false
    }
    
    private let DATA = Array(1...99)
    var items:[Item] = []
    private var countItems:Int
    var nextItem:Item?
    var status:StatusGame = .start
    
    init(countItems:Int){
        self.countItems = countItems
        setupGame()
    }
    
    private func setupGame() {
        var digits = DATA.shuffled()
        
        while items.count < countItems {
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first //перемешали и взяли первый из списка
    }
    
    func check(index:Int) {
        if items[index].title == nextItem?.title{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in
                item.isFound == false
            })
        }
    
        //если больше нет элементов/кнопок которые надо найти
        if nextItem == nil{
            status = .win
        }
    }
}
