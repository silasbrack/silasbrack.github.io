(find posts/* -maxdepth 1 | while read -r file; do echo "<a href=\""$file"\">"$(cat $file | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g')"</a>"; done) | grep -o '<a href="posts/.*">.\{1,\}</a>' | sed 's/"/\\"/g' |  xargs -I '{}' sed -e 's|{{ INDEX }}|{}|g' index_template.html