//
//  DropContainer.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

public struct DropContainer<V: View> : View {
    
    @EnvironmentObject var manager: DragNDropManager
    public let elementId: UUID
    private let makeView: (Bool)-> V
    
    public init(id: UUID, @ViewBuilder _ factory: @escaping (Bool) -> V) {
        self.elementId = id
        self.makeView = factory
    }
    
    public var body: some View {
        makeView(manager.canDrop(on: elementId))
            .droppable(containerId: elementId)
    }
}
