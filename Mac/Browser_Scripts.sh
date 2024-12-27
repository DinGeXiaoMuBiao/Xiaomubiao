#!/bin/bash

# 定义语言、时区和分辨率的数组
LANGUAGES=("en-US" "zh-CN" "es-ES" "fr-FR" "de-DE")
TIMEZONES=("America/New_York" "Europe/London" "Asia/Shanghai" "Australia/Sydney" "Africa/Johannesburg")
RESOLUTIONS=("1920,1080" "1366,768" "1440,900" "1600,900" "1280,720")

# 創建1000個腳本文件，並設置為可執行
for i in {1..1000}
do
    # 随机分配语言、时区和分辨率
    LANG=${LANGUAGES[$RANDOM % ${#LANGUAGES[@]}]}
    TZ=${TIMEZONES[$RANDOM % ${#TIMEZONES[@]}]}
    RESOLUTION=${RESOLUTIONS[$RANDOM % ${#RESOLUTIONS[@]}]}
    
    # 定义脚本文件名
    script_name="Open_chrome_$i.sh"
    
    # 創建腳本文件並寫入內容
    cat <<EOL > $script_name
#!/bin/bash
export TZ="$TZ"
open -na "Google Chrome" --args \
    --user-data-dir="/Users/用户名/Browser/Chrome/MainNetwork/$i" \
    --new-window "file:///Users/用户名/Browser/Chrome/Num/$i.html" \
    --lang="$LANG" \
    --window-size="$RESOLUTION" \
    --force-device-scale-factor=1 \
    --disable-translate \
    --disable-features="TranslateUI,LanguageDetection" \
    --enable-features="NetworkService,NetworkServiceInProcess" \
    --accept-lang="$LANG" 
EOL

    # 設置腳本為可執行
    chmod +x $script_name
done

echo "All scripts created successfully!"
