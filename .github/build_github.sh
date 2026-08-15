# move lc to working folder
mv "$archive_path.xcarchive/Products/Applications" Payload

# remove sidestore support framework from the bundle for a plain LiveContainer ipa
# (no built-in SideStore, so no pairing file is required)
mkdir -p ./tmp
if [ -d "Payload/LiveContainer.app/Frameworks/SideStore.framework" ]; then
    mv Payload/LiveContainer.app/Frameworks/SideStore.framework ./tmp/SideStore.framework
fi

# package
zip -r "$scheme.ipa" "Payload" -x "._*" -x ".DS_Store" -x "__MACOSX"

# cleanup
rm -rf ./tmp