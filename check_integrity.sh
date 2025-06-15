#!/bin/bash

SCRIPT_DIR="/opt/scripts"
BASELINE_FILE="/opt/scripts/baseline_hashes.txt"
REPORT_FILE="/opt/scripts/integrity_report.txt"
CURRENT_HASHES="/tmp/current_hashes.tmp"


find "$SCRIPT_DIR" -type f -exec sha256sum {} \; | sort > "$CURRENT_HASHES"


if [ ! -f "$BASELINE_FILE" ]; then
    cp "$CURRENT_HASHES" "$BASELINE_FILE"
    echo "İlk çalışma: Baseline oluşturuldu." > "$REPORT_FILE"
    exit 0
fi


diff_output=$(diff "$BASELINE_FILE" "$CURRENT_HASHES")

if [ -n "$diff_output" ]; then
    echo "FARK TESPİT EDİLDİ - $(date)" > "$REPORT_FILE"
    echo "$diff_output" >> "$REPORT_FILE"
else
    echo "Her şey normal - $(date)" > "$REPORT_FILE"
fi

rm "$CURRENT_HASHES"
