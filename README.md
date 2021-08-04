# sheep_animation

Package that makes creating Flutter animation easier.

## Example

Initialize your own AnimationProvider which has one parameter DotsTickerProvider.

```dart
final AnimationProvider _animationProvider = AnimationProvider(DotsTickerProvider(true));
```

After that, you should call the setUpAnimation to correctly use the other animation control 
methods. This method will call your function every time the animation value changes.
 
 ```dart
_animationProvider.setUpAnimation(tickFunction: (value) => update(value));
```

Starts the animation. You need to specify the value of start, end, duration animation.

```dart
_animationProvider.forward(0.0,300.0,400.0);
```

Will return true or false depending on whether the animation is active.

```dart
_animationProvider.isAnimationActive();
```

Stops running this animation and successfully completes futures. The animation stops in its current
state.

```dart
_animationProvider.stop();
```

