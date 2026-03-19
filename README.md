# FittedBox & FractionallySizedBox Demo

A small Flutter presentation project that demonstrates:

- `FittedBox`: how a child scales to fit inside its parent
- `FractionallySizedBox`: how a child takes a fraction of the parent size

## Run the demo

1. Make sure Flutter SDK is installed and available in your PATH.
2. Open this folder in terminal.
3. Run:

```bash
flutter pub get
flutter run
```

If this folder does not contain platform folders yet (`android`, `ios`, etc.), run:

```bash
flutter create .
flutter pub get
flutter run
```

## Presentation flow idea

1. Open the **FittedBox** tab.
2. Change `BoxFit` mode (`contain`, `cover`, `fitWidth`, `none`) and describe how the same child behaves.
3. Open the **FractionallySizedBox** tab.
4. Move width/height sliders to show percentage-based responsive sizing.
