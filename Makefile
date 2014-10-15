.PHONY: patch
patch: the.patch

the.patch: old new
	LC_ALL=C TZ=UTC0 diff -Naur old new > the.patch || true

.PHONY: test
test: the.patch
	rm -rf tmp
	cp -r old tmp
	patch -Np1 -d tmp < the.patch
	diff -r new tmp

.PHONY: clean
clean:
	rm -rf tmp tmp.rej the.patch
