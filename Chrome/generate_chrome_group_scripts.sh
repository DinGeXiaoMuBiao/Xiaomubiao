#!/bin/bash

# 創建100個腳本文件，每個腳本包含10個命令
for group in {1..100}
do
    # 創建每個組的腳本文件名稱，例如 MainNetwork_Group_1.sh
    script_name="MainNetwork_Group_$group.sh"
    
    # 創建腳本文件並寫入標頭
    echo "#!/bin/bash" > $script_name
    
    # 對於每個組，添加10個命令
    for i in $(seq $(( (group - 1) * 10 + 1 )) $(( group * 10 )))
    do
        echo "open -na \"Google Chrome\" --args --user-data-dir=\"/Users/用户名/Browser/Chrome/MainNetwork/$i\" --new-window \"file:///Users/用户名/Browser/Chrome/Num/$i.html\"" >> $script_name
    done
    
    # 設置腳本為可執行
    chmod +x $script_name
done
