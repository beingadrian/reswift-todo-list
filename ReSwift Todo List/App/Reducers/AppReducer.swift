
//
//  AppReducer.swift
//  ReSwift Todo List
//
//  Created by Adrian Wisaksana on 3/14/17.
//  Copyright © 2017 Adrian Wisaksana. All rights reserved.
//

import ReSwift

/// The `AppReducer` reduces actions into a state.
struct AppReducer: Reducer {
    
    func handleAction(action: Action, state: AppState?) -> AppState {
        
        // if state is nil
        // set intiial state with empty tasks
        var state = state ?? AppState(tasks: [])
        
        switch action {
        case let action as AddTask:
            //
            // ADDING A NEW TASK
            //
            
            // 1. Create a new task with a unique ID and the given task name
            let newTask = Task(id: UUID().uuidString, title: action.taskName)
            
            // 2. Append newly created task to the tasks array
            state.tasks.append(newTask)
        case let action as RemoveTask:
            //
            // REMOVING A TASK
            //
            
            // 1. get index of task given its id
            guard let index = state.tasks.index(where: { $0.id == action.taskId }) else {
                // if task with id is not found
                // exist scope
                break
            }
            
            // 2. remove task
            state.tasks.remove(at: index)
        default:
            break
        }
        
        return state
        
    }
    
}
