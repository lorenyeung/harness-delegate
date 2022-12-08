# ARG CODE_VERSION=<+pipeline.variables.immutabletag>
ARG CODE_VERSION=$tag
FROM harness/delegate-immutable:${CODE_VERSION}

ENV key=value
