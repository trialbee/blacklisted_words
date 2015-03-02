# Blacklisted words

## Ad words

Blacklisted words in ads on Google AdWords.

## Passwords

Blacklisted passwords, data from (10-million login combos.)[https://xato.net/passwords/ten-million-passwords/].

Import blacklisted passwords (assumes a single string on each line):

```SQL
-- MySQL
LOAD DATA INFILE '/~/passwords.txt'
INTO TABLE passwords
COLUMNS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 0 LINES
(value)
SET passwords.id = NULL,
created_at = NOW(),
updated_at = NOW();
```

Performance (2012 MBP):

* MySQL: Import of 5.2 million records in ~25 seconds
* `Password.where()` in ~2 seconds
* `Password.where('value like ?', "%#{params[:password]}%")` in ~3-4 seconds
