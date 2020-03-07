#!/bin/sh

git filter-branch --env-filter '
OLD_EMAIL="weihuanghu@weihuanghu-mb0.lan"          #修改参数为你的旧提交邮箱
CORRECT_NAME="huweihuang"                #修改参数为你新的用户名
CORRECT_EMAIL="huweihuang@foxmail.com"  #修改参数为你新的邮箱名
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
