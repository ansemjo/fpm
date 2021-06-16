A simple container image with [fpm](https://fpm.readthedocs.io/en/latest/index.html) inside.

> Packaging made simple.

## Usage

Primarily devised for usage in Makefiles to package up your built software projects.
Usage can be as simple as substituting `fpm` with:

    podman run --rm -v $PWD:/src ghcr.io/ansemjo/fpm [...]

In a `Makefile` you could define it as a variable and then use it as if you had `fpm`
installed locally:

```make
FPM := podman run --rm --net none -v $$PWD:/src ghcr.io/ansemjo/fpm

# build packages
.PHONY: package-%
package-% : install
  $(FPM) -s dir -t $* -f --chdir $(DESTDIR) \
    --name $(PKGNAME) --version $(PKGVERSION) \
    --maintainer $(PKGAUTHOR) --license $(PKGLICENSE) \
    --url $(PKGURL)
```
