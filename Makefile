VERSION ?= 1.1.0

default: build

clean:
	docker rmi bborbe/smtp:$(VERSION)

build:
	docker build --build-arg VERSION=$(VERSION) --no-cache --rm=true -t bborbe/smtp:$(VERSION) .

run:
	docker run \
	-p 25:25 \
	-p 587:587 \
	-e HOSTNAME=localhost.localdomain \
	-e RELAY_SMTP_SERVER=mail.benjamin-borbe.de \
	-e RELAY_SMTP_PORT=25 \
	-e ALLOWED_SENDER_DOMAINS="" \
	-e ALLOWED_NETWORKS="" \
	bborbe/smtp:$(VERSION)

shell:
	docker run -i -t bborbe/smtp:$(VERSION) /bin/bash

upload:
	docker push bborbe/smtp:$(VERSION)





