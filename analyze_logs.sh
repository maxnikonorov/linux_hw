#!/bin/bash

LOG_FILE="access.log"
REPORT_FILE="report.txt"

echo "Отчет по файлу логов: $LOG_FILE" >> $REPORT_FILE
echo "========================================" >> $REPORT_FILE

echo "Общее количество запросов:" >> $REPORT_FILE
TOTAL_REQUESTS=$(wc -l < $LOG_FILE)
echo "$TOTAL_REQUESTS" >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Количество уникальных IP-адресов:" >> $REPORT_FILE
UNIQUE_IPS=$(awk '{print $1}' $LOG_FILE | sort | uniq | wc -l)
echo "$UNIQUE_IPS" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "Количество запросов по методам:" >> $REPORT_FILE
awk '{print $6}' $LOG_FILE | sort | uniq -c | sort -rn >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "Самый популярный URL:" >> $REPORT_FILE
POPULAR_URL=$(awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -rn | head -n 1)
echo "$POPULAR_URL" >> $REPORT_FILE
echo "" >> $REPORT_FILE

echo "Отчет успешно создан в файле $REPORT_FILE"

