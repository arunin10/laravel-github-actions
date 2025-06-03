# === CONFIG ===
$serverUser = "arul.kumar"
$serverHost = "10.0.2.12"
$remotePath = "D:\Web1\arul\testing1"


# === STEP 1: Sync files ===
Write-Host "Deploying Laravel project to $serverHost..."
scp -r * "$serverUser@$serverHost:${remotePath}"

# === STEP 2: SSH and run Laravel setup ===
$commands = @"
cd C:\inetpub\laravel-app
composer install --no-dev --optimize-autoloader
php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache
"@

ssh $serverUser@$serverHost $commands
