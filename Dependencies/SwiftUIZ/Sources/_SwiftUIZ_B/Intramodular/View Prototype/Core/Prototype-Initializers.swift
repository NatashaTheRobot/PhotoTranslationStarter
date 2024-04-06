//
// Copyright (c) Vatsal Manot
//

@_spi(Internal) import Merge
@_spi(Internal) import Swallow
import SwiftUIX

extension Prototype {
    public init<T: _SwiftUI_WithPlaceholderGenericTypeParameters>(
        _ type: T.Type,
        _ parameter: T._SwiftUI_GenericParameterTypeName,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            _configuration: .init(
                anchor: .swiftUI(.init(type: type, parameter: parameter))
            ),
            content: content()
        )
    }
    
    public init<T: _SwiftUI_WithPlaceholderGenericTypeParameters>(
        _ type: T.Type,
        _ parameter: T._SwiftUI_GenericParameterTypeName
    ) where Content == _AutogeneratedPrototypeContent {
        self.init(
            type,
            parameter,
            content: {
                _AutogeneratedPrototypeContent()
            }
        )
    }
    
    public init<T: _SwiftUI_WithPlaceholderGenericTypeParameters>(
        _ type: T.Type,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            _configuration: .init(
                anchor: .swiftUI(.init(type: type, parameter: nil))
            ),
            content: content()
        )
    }
    
    public init<T: _SwiftUI_WithPlaceholderGenericTypeParameters>(
        _ type: T.Type
    ) where Content == _AutogeneratedPrototypeContent {
        self.init(
            type,
            content: {
                _AutogeneratedPrototypeContent()
            }
        )
    }
    
    public init(
        _ keyword: _ViewPrototypeAnchorKeyword,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            _configuration: .init(
                anchor: .keyword(keyword)
            ),
            content: content()
        )
    }
}
