# bojo_demo

Minimal project that consumes a package from another repository.

```bash
bojo build
./out/bojo_demo
```

`bojo.toml`:

```toml
[[deps-from]]
repo  = "https://github.com/LukasLow/bojo_demo_pkg"
tag   = "addition/v0.1.0"
libs  = ["addition"]
```

`main.mojo` imports the package under its own route:

```mojo
from addition import add, multiply
```

No `-I`, no linker flag, no path — and the same source works on macOS and Linux.

## Why `[[deps-from]]` and not `[deps-from."<url>"]`

Because one repository may publish several packages, each with its own tag
(`addition/v0.1.0`, `hello/v0.1.0`). A table per repository could hold only one
version; an array of tables holds one entry per (repository, version).

## License

Apache-2.0. See `LICENSE`.
