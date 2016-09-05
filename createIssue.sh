#!/bin/bash
echo "*************KITAPYURDU*************"
echo "Menu"
echo "*************KITAPYURDU*************"

echo "Select your project name:"
echo "*web (w)"
echo "*cronint (c)"
echo "*mobile (m)"

projectName="empty"
while [ $projectName = "empty" ]
do
read -p 'Please type w,c or m: ' projectName
if [ $projectName = "w" ]; then
  projectName="web"
elif [ $projectName = "c" ]; then
  projectName="cronint"
elif [ $projectName = "m" ]; then 
 projectName="mobile"
else	
  projectName="empty"
  echo "You have selected wrong project name.Please try again!"
fi
done
echo "You have selected" $projectName "!!!"
echo "====================================="
echo "Select repository name:"
repoName="empty"
if [ $projectName = "web" ]; then
  echo "*kitapyurdu (kp)"
  echo "*FacebookApplication (fa)"
  while [ $repoName = "empty" ]
  do
  read -p 'Please type kp or fa: ' repoName
  if [ $repoName = "kp" ]; then
  	repoName="kitapyurdu"
  elif [ $repoName = "fa" ]; then
  	repoName="FacebookApplication"
  else
	repoName="empty"
	 echo "You have typed wrong shortcut.Please try again!"
   fi
   done
elif [ $projectName = "cronint" ]; then
  echo "*CronJob (cj)"
  echo "*Tiger (t)"
   while [ $repoName = "empty" ]
  do
  read -p 'Please type cj or t: ' repoName
  if [ $repoName = "cj" ]; then
        repoName="CronJob"
  elif [ $repoName = "t" ]; then
        repoName="Tiger"
  else 
        repoName="empty"
        echo "You haved typed wrong shorcut.Please try again!"
  fi
  done
else
 echo "*android (a)"
 echo "*ios (i)"
 while [ $repoName = "empty" ]
  do
  read -p 'Please type a or i: ' repoName
  if [ $repoName = "a" ]; then
        repoName="android"
  elif [ $repoName = "i" ]; then
        repoName="ios"
  else
        repoName="empty"
         echo "You have typed wrong shortcut.Please try again!"
   fi
   done
    echo "Select mobile project:"
    echo "**********************"
    mobileRepo="empty"
   while [ $mobileRepo = "empty" ]
   do
   if [ $repoName = "android" ]; then
      echo "*Games (g)"
      echo "*Mylib (ml)"
      echo "*Store (st)"
      read -p 'Please type g,ml or st for android project: ' mobileRepo
      if [ $mobileRepo = "g" ]; then
            mobileRepo="Games"
      elif [ $mobileRepo = "ml" ]; then
            mobileRepo="Mylib"
      elif [ $mobileRepo = "st" ]; then
            mobileRepo="Store"
      else
            mobileRepo="empty"
            echo "You have typed wrong shortcut. Please try again!"
      fi
   elif [ $repoName = "ios" ]; then
      echo "*Games (g)"
      echo "*Store (st)"
      echo "*Stock (sk)"
      read -p 'Please type g,st or sk for ios project: ' mobileRepo
      if [ $mobileRepo = "g" ]; then
            mobileRepo="Games"
      elif [ $mobileRepo = "st" ]; then
            mobileRepo="Store"
      elif [ $mobileRepo = "sk" ]; then
            mobileRepo="Stock"
      else
            mobileRepo="empty"
            echo "You have typed wrong shortcut. Please try again!"
      fi
    fi
   done
		
fi
echo "You have selected" $repoName "!!!"

if [ $projectName = "mobile" ]; then
 echo "You have selected" $mobileRepo "Mobile Project!!!"
fi

echo "====================================="
read -p 'Please type issue number(without i): ' issueNumber

svn mkdir https://kyrepo.sourcerepo.com/kyrepo/$projectName/branch/i$issueNumber -m "begins #"$issueNumber" Branch was created."
echo "Hey man! Your branch is ready."
if [ $projectName = "mobile" ]; then
svn copy https://kyrepo.sourcerepo.com/kyrepo/$projectName/$repoName/$mobileRepo https://kyrepo.sourcerepo.com/kyrepo/$projectName/branch/i$issueNumber/$mobileRepo -m "Trunk > Branch"
else
svn copy https://kyrepo.sourcerepo.com/kyrepo/$projectName/$repoName https://kyrepo.sourcerepo.com/kyrepo/$projectName/branch/i$issueNumber/$repoName -m "Trunk > Branch"
fi
echo "Trunk > Branch. You are really fast!!"

if [ $repoName = "kitapyurdu" ]; then
cd /var/www/html/kitapyurdu/branch/

svn co https://kyrepo.sourcerepo.com/kyrepo/web/branch/i$issueNumber ./i$issueNumber
echo "Checkout done to remote....!"
cd i$issueNumber
cd $repoName/

chmod -R 0777 admin/view/image/invoice/
chmod -R 0777 system/data
chmod -R 0777 system/cache
chmod -R 0777 system/barcode
chmod -R 0777 system/logs
chmod -R 0777 image
chmod -R 0777 upload/
chmod -R 0777 download
fi

echo "That's all. Let's start!"
echo "Happy coding. Move move move. Create awesome software!"
