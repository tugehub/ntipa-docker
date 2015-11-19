<?php
/**
 * Il file base di configurazione di WordPress.
 *
 * Questo file definisce le seguenti configurazioni: impostazioni MySQL,
 * Prefisso Tabella, Chiavi Segrete, Lingua di WordPress e ABSPATH.
 * E' possibile trovare ultetriori informazioni visitando la pagina: del
 * Codex {@link http://codex.wordpress.org/Editing_wp-config.php
 * Editing wp-config.php}. E' possibile ottenere le impostazioni per
 * MySQL dal proprio fornitore di hosting.
 *
 * Questo file viene utilizzato, durante l'installazione, dallo script
 * rimepire i valori corretti.
 *
 * @package WordPress
 */

// ** Impostazioni MySQL - E? possibile ottenere questoe informazioni
// ** dal proprio fornitore di hosting ** //
/** Il nome del database di WordPress */
define('DB_NAME', 'wordpress');

/** Nome utente del database MySQL */
define('DB_USER', 'root');

/** Password del database MySQL */
define('DB_PASSWORD', 'grandepuffo');

/** Hostname MySQL  */
define('DB_HOST', 'localhost');

/** Charset del Database da utilizare nella creazione delle tabelle. */
define('DB_CHARSET', 'utf8');

/** Il tipo di Collazione del Database. Da non modificare se non si ha
idea di cosa sia. */
define('DB_COLLATE', '');

/**#@+
 * Chiavi Univoche di Autenticazione e di Salatura.
 *
 * Modificarle con frasi univoche differenti!
 * E' possibile generare tali chiavi utilizzando {@link https://api.wordpress.org/secret-key/1.1/salt/ servizio di chiavi-segrete di WordPress.org}
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '0KwRM?Nw0^+k^%e1:$B+h#|-}K)<fb7JcK6@xw=AAG6-{kC<>r/l5HQ=R5+Y%@}f');
define('SECURE_AUTH_KEY',  'wD;fO?%To,E3H<_L{{kiz1@h/aGF2?/v^Nrv*jz- ]:!qmE>Io?IyQ:m`>u*ZhV-');
define('LOGGED_IN_KEY',    '^v*6s(T8kT8+;/&+^+K=Gx6KK0v8cJY <{f |}S5->3|,pHZVz6`:IS)g+(|KKn}');
define('NONCE_KEY',        '--.L:sJj1BMIzfH-2f |=u/Er+hiAXW*eXXm#h,-UqB*/i+=}}e:egz32QeL1B^i');
define('AUTH_SALT',        '@utVr5W&-$f._08+ R_47Duw+lwz(S6#7`nF-z8fj@+=nS|&QL>r:|-:bo*%ns4|');
define('SECURE_AUTH_SALT', '9ZHku_0q1JS@&=A0i0Qiqy+ s62L|$kbTb+qZ)K?+;H>5 UZ|kVKy`fC)>rls}R>');
define('LOGGED_IN_SALT',   'VJdIgEp.!5.66#1gf;W2QBK-DP0?Ms:l7w7SCc!oxS1mTEM*]v[Ne3z5gK;3DAQ*');
define('NONCE_SALT',       '[om|44|e(TH6y)?]B*R_K@@jCWM=w!~h:<5(7XvGI4<6bkZPy;%Bq,)Y*-_ 9ky}');

/**#@-*/

/**
 * Prefisso Tabella del Database WordPress .
 *
 * E' possibile avere installazioni multiple su di un unico database if you give each a unique
 * fornendo a ciascuna installazione un prefisso univoco.
 * Solo numeri, lettere e sottolineatura!
 */
$table_prefix  = 'wp_';

/**
 *
 * Modificare questa voce a TRUE per abilitare la visualizzazione degli avvisi
 * durante lo sviluppo.
 * E' fortemente raccomandato agli svilupaptori di temi e plugin di utilizare
 * WP_DEBUG all'interno dei loro ambienti di sviluppo.
 */
define('WP_DEBUG', false);

/* Finito, interrompere le modifiche! Buon blogging. */

/** Path assoluto alla directory di WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Imposta lle variabili di WordPress ed include i file. */
require_once(ABSPATH . 'wp-settings.php');

