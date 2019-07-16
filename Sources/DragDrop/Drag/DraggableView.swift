//
//  DraggableView.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

public struct DraggableView<V: View> : View {
    
    @EnvironmentObject var manager: DragNDropManager
    public let elementId: UUID
    private let makeView: (DragInfo)-> V
    
    public struct DragInfo {
        public let isDragging: Bool
        public let offset: CGSize
    }
    
    public init(id: UUID, @ViewBuilder _ factory: @escaping (DragInfo) -> V) {
        self.elementId = id
        self.makeView = factory
    }
    
    public var body: some View {
        let info = DragInfo(isDragging: manager.isDragging(id: elementId), offset: manager.draggingOffset(for: elementId))
        return makeView(info).offset(info.offset).draggable(id: elementId)
    }
}
