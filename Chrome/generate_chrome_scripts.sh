#!/bin/bash

# 創建1000個腳本文件，並設置為可執行
for i in {1..1000}
do
    script_name="Open_chrome_$i.sh"
    
    # 創建腳本文件並寫入內容
    cat <<EOL > $script_name
#!/bin/bash
open -na "Google Chrome" --args --user-data-dir="/Users/用户名/Browser/Chrome/MainNetwork/$i" --new-window "file:///Users/用户名/Browser/Chrome/Num/$i.html"
EOL

    # 設置腳本為可執行
    chmod +x $script_name
done

