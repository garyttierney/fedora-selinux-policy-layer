# fedora-policy-layer

A small CIL policy abstraction over Fedora's existing targeted policy to
make it easier to author local policy modules for applications and system
services.

## Introduction

The focus of this abstraction is making it easier for policy authors to handle
common tasks, such as writing policy for new init daemons.  The semantics of CIL
provide a much better platform for doing this than the macros of Ref Policy, and
the usage of namespaces can cut down on the complexity greatly.  The idea for this
policy is mostly inspired by the DefenSec DSSP policy and some discussions
about documentation between myself and grift.

DSSP Policy: https://github.com/defensec/dssp2-standard

## Installing

### Requirements

CIL is relatively new to SELinux and is available in the versions of the following
packages:

* libsepol, >= 2.4
* policycoreutils, >= 2.4

These packages are available on the following distributions:

* CentOS/RHEL, >= 7.3
* Fedora, >= 24
* Debian, Stretch (testing) [1]

[1] - Debian uses a fork of refpolicy which Fedora has diverged from quite a bit,
so while in theory since it's a fork and this abstraction focuses on the base policy
most things should be work, it has not been tested.

There's a makefile included for loading the policy, along with one example
module. To load the policy run `make load`, and to load the contrib module
run `make load-contrib`.

## Uninstalling

You can remove the modules from your policy store by running `make unload`.
This will remove any modules which have a name matching a file under src/.

## Documentation

TODO

## Example

There are currently some contrib modules being ported under the src/contrib
tree, as well as an example of some basic policies under src/examples/

See:

* src/examples/my_system_service.cil
* src/contrib/ircd.cil
