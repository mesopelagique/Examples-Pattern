# Adapter

[@wikipedia](https://en.wikipedia.org/wiki/Adapter_pattern)

Adapt an instance (the adaptee) to work for a client(a method or a function) using an adapter.

## Example

We have a [display](Project/Sources/Methods/display.4dm) method that could display shaped defined by an origin (x and y) and a size (width, height)

But we define a [Rectangle](Project/Sources/Classes/Rectangle.4dm) class b its corner. Points x1, y1 and x2, y2. So it could not be displayed with `display`

```4d
$rectangle:=cs.Rectangle.new(0;5;100;200)
display($rectangle) // -> 🚫 FAILED
```

We use an Adapter [LegacyRectangle](Project/Sources/Classes/LegacyRectangle.4dm)

```4d
$legacy:=cs.LegacyRectangle.new($rectangle)
display($legacy) // -> ✅ Success
```

## Test

### test plan

- While creating rectangle defined by corner
  - it should not display
  - but with adapter it should display

### code

For test purpose [display](Project/Sources/Methods/display.4dm) return `True` if the shape could be displayed, `False` otherwise.

The [test method](Project/Sources/Methods/main.4dm) show you result of `display` for the two case.
