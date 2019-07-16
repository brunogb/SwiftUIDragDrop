//
//  View+Droppable.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

extension View {
    func droppable(containerId: UUID, manager: DragNDropManager)-> Self.Modified<DropContainerModifier> {
        Modified(content: self, modifier: DropContainerModifier(manager: manager, elementId: containerId))
    }
}
