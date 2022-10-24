#!/bin/bash

type=$1

mkdir -p $type

if [[ ( $type == "spdx" ) ]]; then
  extension=$type
  bom generate -n http://example.com/ --image mattiasgees/s3c-demo:main > $type/bom.$extension
else
  extension="json"
fi

if [[ ( $type == "cyclonedx" ) ]]; then
  extension="xml"
  syft mattiasgees/s3c-demo:main -o $type > $type/syft.$extension
else
  if [[ ( $type == "cyclonedx-json" ) ]]; then
    syft mattiasgees/s3c-demo:main -o $type > $type/syft.$extension
    trivy image --format cyclonedx --output $type/trivy.$extension mattiasgees/s3c-demo:main
  else
    syft mattiasgees/s3c-demo:main -o $type > $type/syft.$extension
    trivy image --format $type --output $type/trivy.$extension mattiasgees/s3c-demo:main
  fi
fi
