//
//  General.swift
//  Format
//
//  Created by Roy Marmelstein on 15/11/2015.
//  Copyright © 2015 Roy Marmelstein. All rights reserved.
//

import Foundation

/**
 *  General formatter.
 */
public enum General: NumberFormatter {
    case Ordinal // Ordinal number in the current locale (e.g. 18eme)
    case SpellOut // Spells out the number in the current locale (e.g. Forty Two).
    case Distance // Takes the source number as distance in meters. Display in current locale.

    /// Modifier
    public var modifier: String {
        switch self {
        case Ordinal:
            return NumberFormatterOrdinalKey
        case SpellOut:
            return NumberFormatterSpellOutKey
        case Distance:
            return NumberFormatterSpellOutKey
        }
    }

    /// Type enum
    public var type: NumberFormatterType {
        return NumberFormatterType.General
    }
}