if [ ! -f .stamp ] ; then
	date -u +%FT%TZ > .stamp
fi

docker build \
	--tag=localhost/afcowie/debian:stretch \
	--network=proxy \
	.
