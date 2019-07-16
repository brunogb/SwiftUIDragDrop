//
//  InteractiveContainer.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//
import Combine
import SwiftUI

public struct InteractiveContainer<V: View> : View {
    
    let manager: DragNDropManager = DragNDropManager()
    
    public var body: AnyView
    
    public init(@ViewBuilder _ factory: () -> V) {
        self.body = AnyView(factory().environmentObject(manager))
    }
    
}
