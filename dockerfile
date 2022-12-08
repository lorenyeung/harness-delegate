ARG CODE_VERSION=<+pipeline.variables.immutabletag>
FROM harness/delegate-immutable:${CODE_VERSION}

ENV key=value
