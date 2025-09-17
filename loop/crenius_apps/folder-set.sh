mkdir 'web-files'
mkdir 'web-files/html'
mkdir 'web-files/css'
mkdir 'web-files/js'

mkdir 'pdf-files'


mkdir 'md-files'
mkdir 'txt-files'


mkdir 'app-files'
mkdir 'app-files/deb'
mkdir 'app-files/apk'
mkdir 'app-files/xapk'
mkdir 'app-files/appImage'
mkdir 'app-files/sh'


mkdir 'image-files'
mkdir 'image-files/jpg'
mkdir 'image-files/jpeg'
mkdir 'image-files/png'
mkdir 'image-files/gif'
mkdir 'image-files/bmp'
mkdir 'image-files/tiff'


mkdir 'vidio-files'
mkdir 'vidio-files/mp4'
mkdir 'vidio-files/avi'
mkdir 'vidio-files/mov'
mkdir 'vidio-files/wmv'
mkdir 'vidio-files/mkv'


mkdir 'office-files'


mkdir 'office-files/powerPoint'
mkdir 'office-files/powerPoint/ppt'
mkdir 'office-files/powerPoint/pptx'

mkdir 'office-files/word'
mkdir 'office-files/word/doc'
mkdir 'office-files/word/docx'

mkdir 'office-files/exal'
mkdir 'office-files/exal/xlsx​'
mkdir 'office-files/exal/xls'

#----------------------------------


mv $(ls | grep .html) 'web-files/html'
mv $(ls | grep .css) 'web-files/css'
mv $(ls | grep .js) 'web-files/js'


mv $(ls | grep .pdf) 'pdf-files'


mv $(ls | grep .md) 'md-files'
mv $(ls | grep .txt) 'txt-files'


mv $(ls | grep .jpg) 'image-files/jpg'
mv $(ls | grep .png) 'image-files/png'
mv $(ls | grep .gif) 'image-files/gif'
mv $(ls | grep .bmp) 'image-files/bmp'
mv $(ls | grep .tiff) 'image-files/tiff'
mv $(ls | grep .jpeg) 'image-files/jpeg'


mv $(ls | grep .mp4) 'vidio-files/mp4'
mv $(ls | grep .avi) 'vidio-files/avi'
mv $(ls | grep .mov) 'vidio-files/mov'
mv $(ls | grep .wmv) 'vidio-files/wmv'
mv $(ls | grep .mkv) 'vidio-files/mkv'


mv $(ls | grep .ppt) 'office-files/powerPoint/ppt'
mv $(ls | grep .pptx) 'office-files/powerPoint/pptx'

mv $(ls | grep .doc) 'office-files/word/doc'
mv $(ls | grep .docx) 'office-files/word/docx'

mv $(ls | grep .xlsx) 'office-files/exal/xlsx'
mv $(ls | grep .xls) 'office-files/exal/xls'


mv $(ls | grep .deb) 'app-files/deb'
mv $(ls | grep .apk) 'app-files/apk'
mv $(ls | grep .xapk) 'app-files/xapk'
mv $(ls | grep .AppImage) 'app-files/appImage'
# mv $(ls | grep .sh) 'app-files/sh'