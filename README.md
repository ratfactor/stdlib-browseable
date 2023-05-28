# Browseable Zig standard library

This shell script and PHP file create a browseable HTML site from the Zig standard library source.

The idea is to inverse the typical emphasis put on comments vs source (**comments are the star of the show**), and highlighting only the most important public names in the source to make them easy to spot.

Most importantly, `@import()` calls get converted to hyperlinks so the library becomes browseable.  Since include paths in the standard library are all relative, the link structure works perfectly with absolutely no modifications. **Too easy!**

Read more about the theory:
http://ratfactor.com/zig/browseable-standard-library

Check out the results: http://ratfactor.com/zig/stdlib-browseable/std.zig.html

![screenshot of example output](http://ratfactor.com/zig/stdlib-browseable/screenshot.png)

## Run it!

The first parameter of the script must be a path to a Zig Std Lib (ending in trailing slash `/`):

    ./build.sh /home/dave/zig/lib/std/

The second parameter _can_ be a wildcard match of files/directories to generate:

    ./build.sh /home/dave/zig/lib/std/ queue
    dwarf.zig
    target.zig
    crypto/blake2.zig
    crypto/aes_ocb.zig
    ...

Output will be generated in a new directory named `output/` _in_ the current directory.

### Run it in Docker/Podman/etc.

A `Dockerfile` is provided which contains all the dependencies needed to run
this generator, if you'd rather not deal with them on your host OS. Docker is
used for this example, though Podman should work as well.

```sh
docker build -t ratfactor/zig-stdlib-browser .

# Now, assuming we've checked out ziglang/zig to ~/src/zig (adjust to fit
# whatever is on your own disk)
docker run --rm -v ~/src/zig:/usr/src/zig -v $(pwd)/output:/usr/src/myapp/output ratfactor/zig-stdlib-browser
```

The `output/` directory _in the current directory_ should now be populated!

## Bash and PHP? Ew!

Seriously, Bash is _perfect_ for gathering the source files and PHP is _perfect_ for generating HTML documents from a template.

Because Zig syntax is so regular and minimal, it is trivial to parse. A handful of regexes are all you need for something like this.

The source is tiny, easy to read (see for yourself!), and pages get generated at a rate of 42 per second, which is fast enough for me.
Oh, and the whole project took just a couple hours to create from scratch, including this README. I think these are the right tools for the job.
