FROM bioboxes/biobox-minimal-base@sha256:c2c5acb0d0be4052d4b927a7fd489738342f163f849fcbc852fc25b000b4f6cb

ADD image/bin    /usr/local/bin
ADD image/share  /usr/local/share

RUN install.sh && rm /usr/local/bin/install.sh

ENV TASKFILE     /usr/local/include/Taskfile
ENV SCHEMA       /usr/local/include/assembler_schema.yaml
ENV BIOBOX_EXEC  assemble.sh
