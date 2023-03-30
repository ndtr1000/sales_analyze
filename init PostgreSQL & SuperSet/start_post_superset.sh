{\rtf1\ansi\ansicpg1251\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 docker run --rm -d --name post_1 -e POSTGRES_PASSWORD=post_admin -e POSTGRES_USER=post_admin -e POSTGRES_DB=analyze_work --net=superset_default -v postsql:/var/lib/postgresql/data postgres:14\
\
cd superset\
\
docker-compose -f docker-compose-non-dev.yml up}