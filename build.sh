#!/bin/bash
vercel --prod
tar cfJ ./build.tar.xz -- *
curl -v --header "PRIVATE-TOKEN: $(cat ~/.deploy.txt)" --header "Content-Type: multipart/form-data" --upload-file ./build.tar.xz https://source.equestria.dev/api/v4/projects/189/packages/generic/cardboard/"$(date +%s)"/cardboard-prod.tar.xz
rm ./build.tar.xz
