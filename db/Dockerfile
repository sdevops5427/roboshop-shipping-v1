#FROM      redhat/ubi9
#RUN       dnf install mysql -y
#COPY      app-user.sql master-data.sql schema.sql run.sh /
#ENTRYPOINT  ["bash", "/run.sh"]

# Stage 1 - Artifact Stage
FROM alpine AS builder

WORKDIR /files

COPY app-user.sql master-data.sql schema.sql run.sh ./

# Stage 2 - Runtime
FROM redhat/ubi9

RUN dnf install -y mysql && \
    dnf clean all

COPY --from=builder /files/ /

RUN chmod +x /run.sh

ENTRYPOINT ["bash", "/run.sh"]