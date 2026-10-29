# bojo_demo

A project that consumes a package from another repository and bundles numpy —
no `-I`, no linker flag, no virtualenv.

```bash
bojo build
./.out/bojo_demo
```

## What it demonstrates

**A remote package.** `bojo.toml` pins a repository and a tag; `main.mojo`
imports the package under its own route:

```toml
[[deps-from]]
repo = "https://github.com/LukasLow/bojo_demo_pkg"
tag  = "addition/v0.0.2"
libs = ["addition"]
```

```mojo
from addition import add, multiply
```

**A bundled Python with numpy.** The interpreter comes from
`bojo toolchain install python 3.12`, the wheels are downloaded and hash-pinned
by `bojo build`, and the launcher sets `PYTHONHOME`, `PYTHONPATH` and
`MOJO_PYTHON_LIBRARY` before Mojo starts:

```toml
[version]
mojo   = "1.2.0"
python = "3.12"

[deps.python]
numpy = "2.1.0"
```

```mojo
from std.python import Python

var np = Python.import_module("numpy")
```

The result is a self-contained directory: `.out/bojo_demo` (launcher),
`.out/bojo_demo.bin` (the Mojo binary), `.out/lib/` (KGEN runtime) and
`.out/python/` (interpreter + packages). Copy `.out/` anywhere with the same
platform and it runs.

## Why `[[deps-from]]` and not `[deps-from."<url>"]`

Because one repository may publish several packages, each with its own tag
(`addition/v0.0.2`, `hello/v0.0.1`). A table per repository could hold only one
version; an array of tables holds one entry per (repository, version).

## License

Apache-2.0. See `LICENSE`.
