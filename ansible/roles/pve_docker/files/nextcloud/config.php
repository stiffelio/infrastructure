<?php
$CONFIG = array (
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'filelocking.enabled' => true,
  'redis' =>
  array (
    'host' => 'redis',
    'port' => 6379,
    'timeout' => 0.0,
  ),
  'datadirectory' => '/data',
  'instanceid' => '{{ nextcloud.instance_id }}',
  'passwordsalt' => '{{ nextcloud.passwordsalt }}',
  'secret' => '{{ nextcloud.secret }}',
  'trusted_domains' =>
  array (
    0 => 'intersect.jakehoward.tech',
  ),
  'dbtype' => 'mysql',
  'version' => '27.0.2.1',
  'overwrite.cli.url' => 'https://intersect.jakehoward.tech',
  'dbname' => 'nextcloud',
  'dbhost' => 'mariadb',
  'dbport' => '3306',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'nextcloud',
  'installed' => true,
  'trusted_proxies' =>
  array (
    0 => '172.17.0.1',
  ),
  'maintenance' => false,
  'theme' => '',
  'loglevel' => 0,
  'preview_max_x' => '2048',
  'preview_max_y' => '2048',
  'jpeg_quality' => '60',
  'has_rebuilt_cache' => true,
  'logfile' => '/config/log/nextcloud.log',
  'default_phone_region' => 'GB',
  'mail_smtpmode' => 'smtp',
  'mail_smtpsecure' => 'ssl',
  'mail_sendmailmode' => 'smtp',
  'mail_from_address' => '{{ nextcloud.email_from_user }}',
  'mail_domain' => '{{ nextcloud.email_from_domain }}',
  'mail_smtpauthtype' => 'LOGIN',
  'mail_smtpauth' => 1,
  'mail_smtphost' => 'smtp.eu.mailgun.org',
  'mail_smtpname' => '{{ nextcloud.email_username }}',
  'mail_smtppassword' => '{{ nextcloud.email_password }}',
  'mail_smtpport' => '465',
);
