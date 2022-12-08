# ARG CODE_VERSION=<+pipeline.variables.immutabletag>
ARG CODE_VERSION=22.12.77617.minimal
FROM harness/delegate-immutable:${CODE_VERSION}

ENV key=value
