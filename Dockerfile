FROM vncgrvs/python-base:latest AS builder
COPY /app/requirements.txt /app/requirements.txt
RUN cd /app && python -m ensurepip --upgrade && pip install -r requirements.txt

FROM vncgrvs/python-base
COPY --from=builder /app /app

ENTRYPOINT [ "python", "/app/main.py" ]