//
//  Array+Extensions.swift
//  Shared
//
//  Created by Kyle Erhabor on 1/19/21.
//

extension Array {
    /// Returns a new array containing unique elements part from the original array.
    ///
    /// If an element already appears in the array, only the first element will be returned. This method preserves the order of the array. In this example,
    /// wrapping an `Array` in a `Set` is a simple and quick way to filter duplicate elements, but does not preserve the order of the array.
    ///
    /// ```
    /// let letters = ["a", "b", "c", "a", "b", "c", "a", "b", "c", "d", "e", "f"]
    /// print(Set(letters))
    /// ```
    ///
    /// In the next example, the `dinstinct` method preserves the order of the array.
    ///
    /// ```
    /// let letters = ["a", "b", "c", "a", "b", "c", "a", "b", "c", "d", "e", "f"]
    /// print(letters.distinct())
    /// ```
    ///
    /// - Complexity: O(*n*), where *n* is the length of the array.
    func distinct() -> [Element] where Element: Hashable {
        // Source: https://stackoverflow.com/a/46354989/14695788
        var seen: Set<Element> = []

        return filter { seen.insert($0).inserted }
    }
}
