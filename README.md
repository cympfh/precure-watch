# what is this

jikkyo hakadoru tool

![](https://pbs.twimg.com/media/Cv8Hz2lUkAA5i-U.jpg:large)

## requirement

- (ba)sh
- twurl
- jq (1.5+)
- web browser

## usage

```bash
$ ./run.sh -t "#precure" -p 8080 -n 20
```

then open `http://127.0.0.1:8080`.


```
-t    track word (search query)
-p    port number (default: 8080)
-n    the num of tweet (old tweets be deleted)
```

