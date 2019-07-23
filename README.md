The MongoDB driver for Go
-------------------------

Please go to [http://labix.org/mgo](http://labix.org/mgo) for all project details.

Notes specific to this Lyft branch
----------------------------------

Running tests in Docker (requires Docker to be installed):

```
./scripts/docker-build && ./scripts/docker-test
```

At the time of this writing, a few tests fail for reasons not
diagnosed. They take several minutes to complete..

An ipv6 dialing test has been disabled in this branch, in order to
avoid needing Docker configuration to enable it to run.
