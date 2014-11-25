pushd tomahawk
cpack
cinst tomahawk -source "%cd%" -force
popd