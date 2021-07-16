# Browseable Zig standard library

This shell script and PHP file create a browseable HTML site from the Zig standard library source.

The idea is to inverse the typical emphasis put on comments vs source (**comments are the star of the show**), and highlighting only the most important public names in the source to make them easy to spot.

Most importantly, `@import()` calls get converted to hyperlinks so the library becomes browseable.  Since include paths in the standard library are all relative, the link structure works perfectly with absolutely no modifications. **Too easy!**

Check out the results: http://ratfactor.com/zig/stdlib-browseable/std.zig.html

![screenshot of example output](http://ratfactor.com/zig/stdlib-browseable/screenshot.png)

## Bash and PHP? Ew!

Seriously, Bash is _perfect_ for gathering the source files and PHP is _perfect_ for generating HTML documents from a template.

Because Zig syntax is so regular and minimal, it is trivial to parse. A handful of regexes are all you need for something like this.

The source is tiny, easy to read (see for yourself!), and pages get generated at a rate of 42 per second, which is fast enough for me.
Oh, and the whole project took just a couple hours to create from scratch, including this README. I think these are the right tools for the job.

I've also got a short article with a little more detail: http://ratfactor.com/zig/browseable-standard-library
