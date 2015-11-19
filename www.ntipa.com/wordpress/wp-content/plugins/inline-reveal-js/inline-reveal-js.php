<?php

/*
Plugin Name: Inline Reveal JS
Plugin URI: http://cratoswebdesign.com
Description: Place a Slid.es Deck in your post/page.  `[slid.es url="" width="" height=""]`.
Version: 1.0.0
Author: Brian Retterer
Author URI: http://cratosdesign.com
License: GPL
*/

require_once('shortcodes/shortcodes.php');

// init process for registering our button
 add_action('init', 'inline_reveal_js_button_init');
 function inline_reveal_js_button_init() {

      //Abort early if the user will never see TinyMCE
      if ( ! current_user_can('edit_posts') && ! current_user_can('edit_pages') && get_user_option('rich_editing') == 'true')
           return;

      //Add a callback to regiser our tinymce plugin   
      add_filter("mce_external_plugins", "inline_reveal_js_register_tinymce_plugin"); 

      // Add a callback to add our button to the TinyMCE toolbar
      add_filter('mce_buttons', 'inline_reveal_js_add_tinymce_button');
}


//This callback registers our plug-in
function inline_reveal_js_register_tinymce_plugin($plugin_array) {
    $plugin_array['inline_reveal_js_button'] = plugins_url() . '/inline-reveal-js/js/shortcode.js';
    return $plugin_array;
}

//This callback adds our button to the toolbar
function inline_reveal_js_add_tinymce_button($buttons) {
            //Add the button ID to the $button array
    $buttons[] = "inline_reveal_js_button";
    return $buttons;
}