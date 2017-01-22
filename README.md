# fedora-policy-layer

A small CIL policy abstraction over Fedora's existing targeted policy to
make it easier to author local policy modules for applications and system
services.

## Introduction

The focus of this abstraction is making it easier for policy authors to handle
common tasks, such as writing policy for new init daemons.  The semantics of CIL
provide a much better platform for doing this than the macros of Ref Policy, and
the usage of namespaces can cut down on the complexity greatly.  The idea for this
policy is mostly inspired by the @DefenSec DSSP policy and some discussions
about documentation between myself and grift.

## Installing

There's a makefile included for loading the policy, along with one example
module. To load the policy run `make load`, and to load the contrib module
run `make load-contrib`.

## Uninstalling

You can remove the modules from your policy store by running `make unload`.
This will remove any modules which have a name matching a file under src/.

## Documentation

TODO

## Example

See: src/custom/my_system_service.cil
