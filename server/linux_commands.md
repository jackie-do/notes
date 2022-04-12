
## Work with file and folder

> List directory with size and sort
```bash
du -h | sort -h
```

> Zip files
```bash
# Normal Zip
zip ../testapp.zip -r * .[^.]*

# Zip by git  
git archive HEAD -o ${PWD##*/}.zip
```
