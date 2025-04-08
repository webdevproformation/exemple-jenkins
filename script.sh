#!/bin/bash                                                           

mkdir tempdir                                                         #(1)
mkdir tempdir/templates                                               #(1)
mkdir tempdir/static                                                  #(1)

cp sample_app.py tempdir/.                                            #(2)
cp -r templates/* tempdir/templates/.                                 #(2)
cp -r static/* tempdir/static/.                                       #(2)

echo "FROM python" >> tempdir/Dockerfile                              #(3)
echo "RUN pip install flask" >> tempdir/Dockerfile                    #(4)
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile        #(5)
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile  #(5)
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile          #(5)
echo "EXPOSE 5050" >> tempdir/Dockerfile                              #(6)
echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile    #(7)

cd tempdir                                                            #(8)
docker build -t sampleapp .                                           #(8)

cd .. 
rm -fr tempdir

docker run -t -d -p 5050:5050 --name samplerunning sampleapp          #(9)
docker ps -a  


