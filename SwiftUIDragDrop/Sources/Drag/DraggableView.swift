//
//  DraggableView.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

struct DraggableView<V: View> : View {
    
    @EnvironmentObject var manager: DragNDropManager
    let elementId: UUID
    private let makeView: (DragInfo)-> V
    
    struct DragInfo {
        let isDragging: Bool
        let offset: CGSize
    }
    
    init(id: UUID, @ViewBuilder _ factory: @escaping (DragInfo) -> V) {
        self.elementId = id
        self.makeView = factory
    }
    
    var body: some View {
        let info = DragInfo(isDragging: manager.isDragging(id: elementId), offset: manager.draggingOffset(for: elementId))
        return makeView(info).offset(info.offset).draggable(id: elementId, manager: manager)
    }
}
