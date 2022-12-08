# ARG CODE_VERSION=<+pipeline.variables.immutabletag>
ARG tag
FROM harness/delegate-immutable:${tag}

ENV key=value
