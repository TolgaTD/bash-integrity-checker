# Bash Integrity Checker (Cron Uyumlu)

Bu script, bir dizin altındaki dosyaların SHA256 hash değerlerini takip ederek, her gece otomatik olarak değişiklik kontrolü yapar. Özellikle `/opt/scripts/` gibi kritik klasörlerde çalışan script dosyalarının değiştirilip değiştirilmediğini anlamak için tasarlanmıştır.

## Özellikler

- İlk çalıştırmada `baseline_hashes.txt` dosyasını oluşturur.
- Sonraki çalıştırmalarda mevcut dosyaların hash değerlerini karşılaştırır.
- Yeni dosya eklenmişse, bir dosya silinmişse ya da içerik değişmişse `integrity_report.txt` dosyasına farkları yazar.
- Cron uyumlu olacak şekilde terminale hiçbir çıktı vermez.

## Kullanım

### 1. Script'i ilgili dizine koy:

```bash
sudo mv check-integrity.sh /opt/scripts/
sudo chmod +x /opt/scripts/check-integrity.sh
