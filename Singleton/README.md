# Singleton

[@wikipedia](https://en.wikipedia.org/wiki/Singleton_pattern)

The singleton pattern is a software design pattern that restricts the instantiation of a class to one "single" instance.

## How to?

To transform you class MyClass to singleton, call `singletonize(This)`

```4d
Class constructor
	// start of your code

  // end of you code
	singletonize(This)
```

[`singletonize`](Projects/Sources/Methods) will:

- register the first instance into `cs.MyClass.instance`
- replace the function `cs.MyClass.new()` to return `cs.MyClass.instance`

### Edit the singleton

The singleton is a shared object and edit must use `Use`

```4d
Use (cs.MyClass.instance)
  cs.MyClass.instance.aValue:=5
End use
```

## Test

### test plan

- if not init instance must be null
- if init instance must not be null and have passed value when initializing at first
- if we re-init instance must not be null and have passed value when initializing at first
- if we edit the singleton, value of instance must be changed
