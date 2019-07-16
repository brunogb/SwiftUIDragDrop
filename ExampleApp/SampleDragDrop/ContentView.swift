//
//  ContentView.swift
//  SampleDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI
import DragDrop

struct ContentView : View {
    
    let container1ID = UUID()
    let container2ID = UUID()
    let dragID = UUID()
    
    var body: some View {
        InteractiveContainer {
            VStack {
                DropContainer(id: container1ID) { canDrop in
                    VStack {
                        Text( canDrop ? "Drop view here": "You cant drop here")
                    }
                    .padding()
                        .background(canDrop ? Color.yellow : Color.blue)
                }
                Spacer()
                    .frame(height: 100)
                DropContainer(id: container2ID) { canDrop in
                    VStack {
                        Text( canDrop ? "Drop view here": "You cant drop here")
                    }
                    .padding()
                        .background(canDrop ? Color.yellow : Color.green)
                }
                Spacer()
                    .frame(height: 100)
                DraggableView(id: dragID) { dragInfo in
                    HStack {
                        Text("Drag me")
                    }
                    .padding()
                        .background( dragInfo.isDragging ? Color.red : Color.white)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
