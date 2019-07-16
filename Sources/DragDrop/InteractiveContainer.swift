//
//  InteractiveContainer.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//
import Combine
import SwiftUI

struct InteractiveContainer<V: View> : View {
    
    let manager: DragNDropManager = DragNDropManager()
    
    var body: _ModifiedContent<V, _EnvironmentKeyWritingModifier<DragNDropManager?>>
    
    init(@ViewBuilder _ factory: () -> V) {
        self.body  = factory().environmentObject(manager)
    }
    
}
